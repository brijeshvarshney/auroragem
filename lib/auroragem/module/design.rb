module Design


	def project_design(id)
		id= id
		new_uri= "projects/#{id}/designs"
		self.apis("GET", "#{new_uri}")
		
	end

	def design_summary(id)
		id= id
		new_uri= "designs/#{id}/summary"
		self.apis("GET", "#{new_uri}")
		
	end


	def create_design(id)
		self.post_apis("POST", "designs" ,"#{id}") 	
	end 


end



