ENV['RACK_ENV'] = 'test'

require 'rspec'
require 'rack/test'
require_relative '../application'

describe 'Application' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  describe 'GET /movies' do
    context 'when production_company specified' do
      it 'returns movies for this production_company' do
        get '/movies?production_company=Miramax%20Films'
        expect(last_response).to be_ok
      end
    end

    context 'when production_company not specified' do
      it 'returns all movies' do
        get '/movies'
        expect(last_response).to be_ok
      end
    end
  end

  describe 'GET /production_companies' do
    context 'when name specified' do
      it 'returns production_companies similar to the name' do
        get '/production_companies'
        expect(last_response).to be_ok
      end
    end

    context 'when name not specified' do
      it 'it returns all production_companies' do
        get '/production_companies'
        expect(last_response).to be_ok
      end
    end
  end
end
