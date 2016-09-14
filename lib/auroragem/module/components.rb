module Components

	def components
		self.apis("GET", "components")
	end	
	
	def get_component(id)
		id= id
		new_uri= "components/#{id}"
		self.apis("GET", "#{new_uri}")
		
	end

end

