class LoginPage < Generic
	def visit()
		@browser.goto 'https://accounts.google.com'
	end

	def login(email,password)
		self.email = email
		self.password = password
		submit
	end

	def email=(email)
		@browser.input(id: 'Email').send_keys email
	end

	def password=(password)
		@browser.input(id: 'Passwd').send_keys password
	end

	def submit()
		@browser.input(id: 'signIn').click
	end
end