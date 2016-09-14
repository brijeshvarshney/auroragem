
require 'openssl'
require 'base64'
require 'uri'
require 'net/http'
require 'json'


module Apis


    def apis(method, api_path)
      http_verb = "#{method}"
      api_uri ="/v1/#{api_path}"

      timestamp = URI.escape(Time.now.utc.to_s)
      host = "api-sandbox.aurorasolar.com"

      get_post_params = nil
      formated_request_string =self.format_request_string(http_verb, api_uri, @aurora_api_key, timestamp, get_post_params)
      signature =self.compute_hmac_signature(formated_request_string, @aurora_api_secret)
      # Make the actual API request:
      end_point = "https://#{host}#{api_uri}?AuroraKey=#{aurora_api_key}&Timestamp=#{timestamp}&Signature=#{signature}"
      uri = URI(end_point)
      json_string = Net::HTTP.get(uri) 
      p json_string
    end

end
