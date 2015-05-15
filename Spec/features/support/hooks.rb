RSpec.configure do |config|
  config.before(:type => :feature) do
    unless $feature_before_hook
      $browser = Watir::Browser.new :ff
      $browser.cookies.clear
      $app = App.new $browser
      $feature_before_hook = true
    end
  end

  # Home Page Feature Hook
  config.before(:home_page => true) do
    unless $home_page_hook
      $nini = FriendList.new($app, 'Nini')
      $neermal = FriendList.new($app, 'Neermal')
      $nini.add_friend($neermal.user)
      $nini_home_page_9gag = Share.new($app, 'Nini')
      $nini_home_page_9gag.new_post
      $nini_home_page_status = Status.new($app, 'Nini', 'Home Page Feature')
      $nini_home_page_status.new_post
      $home_page_hook = true
    end
  end

  config.after(:home_page_teardown => true) do
    $nini_home_page_status.delete!
    $nini_home_page_9gag.delete!
    $nini.unfriend
    $browser.close
  end
end