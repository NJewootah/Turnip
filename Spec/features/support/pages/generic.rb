class Generic
  include RSpec::Matchers
  attr_accessor :browser
  
  def initialize(browser)
    @browser = browser
  end
end
