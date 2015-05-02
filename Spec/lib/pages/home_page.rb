class HomePage < Generic
	def visit()
		@browser.goto 'http://youtube.com'
	end
end