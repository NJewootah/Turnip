class Taskbar < Generic
	def search(term)
		@browser.input(id: 'masthead-search-term').send_keys term
		@browser.input(id: 'masthead-search-term').send_keys :enter
	end
end