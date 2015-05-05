class HomePage < Generic
  def visit()
    @browser.div(class: '_5ah-').wait_until_present
    @browser.div(class: '_5ah-').click
  end

  def check_status_exist(message)
    @browser.div(class: '_5pbx userContent').p(text: message).wait_until_present
  end
end
