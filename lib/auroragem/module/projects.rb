module Projects

	def projects
		self.apis("GET", "projects")
	end	
	
	def get_project(id)
		id= id
		new_uri= "projects/#{id}"
		self.apis("GET", "#{new_uri}")
		
	end

	def create_project(id)
		self.post_apis("POST", "projects" ,"#{id}")
	end 


end

