class LoginPage < Generic
  
  # set default credentials
  PASSWORD = 'Pass123w'
  USER = {
    Nini: 'ninistudies@gmail.com', 
    Neermal: 'ninitests@gmail.com'
  }

  def visit()
    @browser.goto 'http://facebook.com'
  end

  def login(user)
    self.email = USER[user.to_sym]
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
