class App
  def initialize(browser)
    @browser = browser
  end

  def taskbar
    Taskbar.new @browser
  end

  def home
    HomePage.new @browser
  end

  def login
    LoginPage.new @browser
  end

  def friend
    FriendPage.new @browser
  end

  def friend_request
    FriendRequestPage.new @browser
  end

  def profile
    ProfilePage.new @browser
  end

  def home_9gag
    Home9GagPage.new @browser
  end
end
