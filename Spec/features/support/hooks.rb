RSpec.configure do |config|
  config.before(:type => :feature) do
    @browser = Watir::Browser.new :ff
    @browser.cookies.clear
    @app = App.new @browser
  end
  
  config.after(:type => :feature) do
    @browser.close
  end

  # Status Feature Hook
  config.before(:status => true) do
    add_friend('Nini', 'Neermal')
  end

  config.after(:status => true) do
    @app.login.visit
    @app.login.login 'Nini'
    @app.profile.visit
    @app.profile.delete_status MESSAGE
    @app.taskbar.logout
    unfriend('Nini', 'Neermal')
  end
end