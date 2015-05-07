class HomePage < Generic
  def visit()
    if @browser.li(id: 'u_0_e').a(text: 'Home').present?
      @browser.li(id: 'u_0_e').a(text: 'Home').click
    else
      @browser.goto 'http://facebook.com'
    end
  end

  def check_status_exist(message)
    @browser.div(class: '_5pbx userContent').p(text: message).wait_until_present
  end
end
