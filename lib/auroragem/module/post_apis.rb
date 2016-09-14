require 'openssl'
require 'base64'
require 'uri'
require 'net/http'
require 'json'

module PostApis
	
	def post_apis(method, api_path, id)

		host = "api-sandbox.aurorasolar.com"
		timestamp = URI.escape(Time.now.utc.to_s)
		http_verb = "#{method}"
		protocol = "443"
		api_uri = "/v1/#{api_path}"
      	
      

 if api_path == "users" or api_path == "users/invite" 
            post_params = {
              "user" => {
                "first_name" => "abrijesh",
                "last_name" => "varshney",
                "email" => "elon-#{rand(1000)}@solarcity.com",
                "phone" => "650-1234-9000",
                "title" => "Chairman of the board",
                "external_provider_id" => "#{id}"
              }
            }
      
          elsif api_path == "designs"
            post_params = {
              "design" => {
                "external_provider_id" => "#{id}",
                "project_id" => "varshney",
                "name" => "new design",
            }
          }
        
          elsif api_path == "projects"
            post_params = {
                "project" => {
                  "external_provider_id" => "#{id}",
                  "name" => "solar",
                  "customer_first_name" => "aurora",
                  "customer_last_name" => "solar",
                  "customer_address" => "india",
                  "latitude" => "",
                  "longitude" => "",
                  "pre_solar_utility_rate_version_id" => "249b91ca-cb5d-4ad8-b03d-6ef654ac3bd8"
            }
          }

        elsif api_path== "consumption_profiles"
         
          post_params = {
              "project" => {
                "project_id" => "#{id}",
                "monthly_energy" => "[1,2,3,4,5,6,7,8,9,88,44,33]"
              }
            }      
        end  


p post_params

	formated_request_string = self.format_request_string(http_verb, api_uri, @aurora_api_key, timestamp, post_params)
	signature = self.compute_hmac_signature(formated_request_string, @aurora_api_secret)
         


        hmac_params = {
        "AuroraKey" => aurora_api_key,
        "Timestamp" => timestamp,
        "Signature" => signature,
     	 }   

		end_point = "https://#{host}#{api_uri}"
		payload = hmac_params.merge(post_params).to_json

		req = Net::HTTP::Post.new(api_uri, initheader = {'Content-Type' =>'application/json'})
		req.body = payload 
		response = Net::HTTP.start(host, protocol, use_ssl: true) {|http| http.request(req) }
		#p response
		puts "Response #{response.code} #{response.message}:\n#{response.body}"

    end
end      