class HomePage < Generic
  def visit()
    if @browser.li(id: 'u_0_e').a(text: 'Home').present?
      @browser.li(id: 'u_0_e').a(text: 'Home').click
    else
      @browser.goto 'http://facebook.com'
    end
  end

  def check_status_exist(message)
    @browser.divs(class: '_5pbx userContent')[0].wait_until_present
    @browser.divs(class: '_5pbx userContent').each do |post|
      if post.text == message
        true
      end
    end
  end
end
