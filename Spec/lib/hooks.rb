RSpec.configure do |config|
	config.before(:type => :feature) do
		@browser = Watir::Browser.new :ff
		@browser.cookies.clear
		@app = App.new @browser
	end

	config.after(:type => :feature) do
		@browser.close
	end
end