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
  config.before(:home_page => true) do
    add_friend('Nini', 'Neermal')
    create_status(MESSAGE)
  end

  config.after(:home_page => true) do
    delete_status(MESSAGE)
    unfriend('Nini', 'Neermal')
  end
end