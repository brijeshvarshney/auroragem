module HashHelper
    
    def flatten_hash(hash)
      hash.each_with_object({}) do |(key, value), global_hash|
        if value.is_a? Hash
          flatten_hash(value).map do |h_k, h_v|
            # Concatenate parent/child key together to ensure uniqueness
            global_hash["#{key}.#{h_k}"] = h_v
          end
      
        else
          global_hash[key] = value
        end
      
      end
    end
  end