module Consumptionpro


	def consumption_profile(id)
		id= id
		new_uri= "consumption_profiles/#{id}"
		self.apis("GET", "#{new_uri}")
	end

	def create_consumption_profile(id)
		self.post_apis("POST", "consumption_profiles" ,"#{id}")
	end 

end




