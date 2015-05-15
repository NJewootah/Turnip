class LoginPage < Generic
  PASSWORD = 'Pass123w'

  def visit()
    unless @browser.text_field(id: 'email').present?
      @browser.goto 'http://facebook.com'
    end
  end

  def login(email)
    self.email = email
    password
    submit
  end

  def email=(email)
    @browser.text_field(id: 'email').set(email)
  end

  def password()
    @browser.text_field(id: 'pass').set(PASSWORD)
  end

  def submit()
    @browser.input(id: 'u_0_l').click
  end
end
