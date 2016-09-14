
module FormatRequestString

    def format_request_string(http_verb, uri, api_key, timestamp, params)
	 	clean_http_verb = http_verb.strip.upcase
	    clean_uri = uri.downcase.strip.chomp("/").gsub /https?:\/\//, "" # Remove protocol
	    clean_uri = clean_uri.gsub /\?.*/, "" # Remove query params. See byte order below
	    clean_api_key = api_key
	    clean_timestamp = timestamp

	    # Put the base query together, without the optional GET/POST params for now.
	    formatted_query = "#{clean_http_verb}\n#{clean_uri}\nAuroraKey=#{clean_api_key}\nTimestamp=#{clean_timestamp}\n"


  		self.format_custom_params(formatted_query, params)
  end

  def format_http_verb(http_verb)
    http_verb.strip.upcase
  end


  def extract_api_endpoint_from_uri(uri)
    clean_uri = uri.downcase.strip.chomp("/").gsub /https?:\/\//, "" # Remove protocol
    clean_uri.gsub /\?.*/, ""
  end


  def format_api_key(api_key)
    unless api_key.include? "%20"
      return URI.escape(api_key)
    end
    api_key
  end


  def format_timestamp(timestamp)
    unless timestamp.include? "%20"
      return URI.escape(timestamp)
    end
    timestamp
  end


  def format_custom_params(formatted_query, params)

    if params && params.size > 0
      sorted_params = ""

      # We hence we recursively parse the tree and flatten the hash to format the query.
      flat_hash = self.flatten_hash params
      sorted_flat_hash = flat_hash.sort.to_h #Ruby sorts in ASCII byte order. Hurray
      sorted_flat_hash.each do |k, v|
        value = v.to_s
          if v.is_a?(Array)
            value = "[#{v.join(",")}]"
          end
      sorted_params << "#{URI.escape(k.to_s)}=#{URI.escape(value)}&"
    end

      sorted_params.chomp! "&" #Remove trailing ampersand
      formatted_query << "#{sorted_params}\n"
    end

      formatted_query

		   
	end 
end
