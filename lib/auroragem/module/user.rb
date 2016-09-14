module User
	def users
		self.apis("GET", "users")
	end	
	
	def get_user(id)
		id= id
		new_uri= "users/#{id}"
		self.apis("GET", "#{new_uri}")
	end

	def invite_user(id)

		self.post_apis("POST", "users/invite", "#{id}")
	end 

	def create_user(id)
		self.post_apis("POST", "users" ,"#{id}")
	end 
end




