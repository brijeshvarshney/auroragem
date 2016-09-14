require 'openssl'

module ComputeHmacSignature

   def compute_hmac_signature(request_string, api_secret)
	 hmac = OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'), api_secret, request_string)
   #Base 64 encode the HMac
    base64_signature = Base64.encode64(hmac)
    #Remove whitespace, new lines and trailing equal sign.
    base64_signature.strip().chomp("=")
	end
end
