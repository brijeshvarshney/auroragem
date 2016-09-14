
module Tenant


	def tenants
		self.apis("GET", "tenants")
	end	
	
	def get_tenants(id)
		id= id
		new_uri= "tenants/#{id}"
		self.apis("GET", "#{new_uri}")
		
	end

end
