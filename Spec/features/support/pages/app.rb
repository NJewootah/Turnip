class App
  def initialize(browser)
    @browser = browser
  end

  def home
    HomePage.new @browser
  end

  def login
    LoginPage.new @browser
  end

  def results
    ResultsPage.new @browser
  end

  def taskbar
    Taskbar.new @browser
  end
end
