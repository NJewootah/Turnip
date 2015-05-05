class Taskbar < Generic
  def search(term)
    @browser.text_field(id: 'q').set term
    @browser.text_field(id: 'q').set :enter
  end

  def logout()
    @browser.div(text: 'Account Settings').click
    @browser.input(value: 'Log out').click
  end
end
