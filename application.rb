require 'sinatra'
require 'json'

# GET /movies
get '/movies' do
  content_type :json
  [].to_json
end

# GET /production_companies
get '/production_companies' do
  content_type :json
  [].to_json
end
