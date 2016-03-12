require 'sinatra'
require 'rspec'
require 'rack/test'
require 'vcr'
require 'webmock'
require 'capybara/dsl'
require 'capybara/rspec'
require 'capybara/poltergeist'

require_relative 'support/wait_for_ajax'
require_relative 'support/string'

ENV['RACK_ENV'] = 'test'

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
  config.ignore_localhost = true
end

Capybara.app = Sinatra::Application
Capybara.javascript_driver = :poltergeist

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include WaitForAjax, type: :feature

  # Add VCR to all tests
  config.around(:each) do |example|
    options = example.metadata[:vcr] || {}
    if options[:record] == :skip
      VCR.turned_off(&example)
    else
      name = example.metadata[:full_description].split(/\s+/, 2).join('/').underscore.gsub(/\./,'/').gsub(/[^\w\/]+/, '_').gsub(/\/$/, '')
      VCR.use_cassette(name, options, &example)
    end
  end
end
