require_relative '../spec_helper'
require_relative '../../application'

describe 'Movies search', type: :feature, js: true do
  it 'searches for movies by producer company' do
    visit '/'
    wait_for_ajax

    fill_in_autocomplete('.typeahead', 'Miramax Films')
    wait_for_ajax

    submit_autocomplete('.typeahead')
    wait_for_ajax

    expect(all('table tbody tr').count).to eq(3)
  end
end

def fill_in_autocomplete(selector, value)
  page.execute_script %Q{$('#{selector}').typeahead('val', '#{value}');}
end

def submit_autocomplete(selector)
  find('.typeahead').native.send_keys(:return)
end
