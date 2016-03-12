require 'sinatra'
require_relative './movies_endpoint'

set :public_folder, 'public'

# GET /
get '/' do
  content_type :html

  File.read(File.join('public', 'index.html'))
end

# GET /movies
get '/movies' do
  content_type :json

  MoviesEndpoint.movies(production_company: params[:production_company]).to_json
end

# GET /production_companies
get '/production_companies' do
  content_type :json

  MoviesEndpoint.production_companies(name: params[:name]).to_json
end
