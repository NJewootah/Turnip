Given(/^I am logged in$/) do
	browser = Watir::Browser.new :ff
	browser.goto 'https://accounts.google.com'
	browser.input(id: 'Email').send_keys 'ninistudies@gmail.com'
	browser.input(id: 'Passwd').send_keys 'Pass123w'
	browser.input(id: 'signIn').click
	browser.goto 'http://youtube.com'
end

When(/^I search for Ruby$/) do
	pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see a list of results relevent to Ruby$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
