require 'net/http'
require 'json'

class MoviesEndpoint
  DATASET_ENDPOINT = 'https://data.sfgov.org/resource/wwmu-gmzc.json'

  def initialize
    @uri = URI.parse(DATASET_ENDPOINT)
    @http = Net::HTTP.new(@uri.host, @uri.port)
    @http.use_ssl = true
    @http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  end

  def self.production_companies(name: nil)
    # Prepare the arguments
    args = {
      :'$select' => 'production_company',
      :'$where' => "production_company like '%#{name}%'",
      :'$group'  => 'production_company'
    }

    # Do request
    result = new.https_get(args)

    # Parse results
    JSON.parse(result).map { |e| e['production_company'] }
  end

  def self.movies(production_company: nil)
    # Prepare the arguments
    args = production_company ? {:'production_company' => production_company} : {}

    # Do request
    result = new.https_get(args)

    # Parse results
    JSON.parse(result)
  end

  def https_get(args)
    @uri.query = URI.encode_www_form(args)
    request = Net::HTTP::Get.new(@uri.request_uri)
    response = @http.request(request)
    response.body
  end
end
