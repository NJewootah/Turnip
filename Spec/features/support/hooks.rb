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
    @app.login.visit
    @app.login.login 'Nini'
    @app.taskbar.search 'Neermal Tests'
    @app.friend.send_friend_request
    @app.taskbar.logout
    @app.login.visit
    @app.login.login 'Neermal'
    @app.friend_request.visit
    @app.friend_request.approve('Nini Tests')
    @app.taskbar.logout
  end

  config.after(:status => true) do
    @app.login.login 'Nini'
    @app.taskbar.search 'Neermal Tests'
    @app.friend.unfriend
  end
end