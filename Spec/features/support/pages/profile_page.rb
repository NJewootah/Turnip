class ProfilePage < Generic
  def visit()
   @browser.span(class: '_2dpb').click
  end

  def new_status(message)
    status_tab
    write_status(message)
    post_status
  end

  def status_tab()
    @browser.div(class: 'lastCapsule').span(text: 'Status').wait_until_present
    @browser.div(class: 'lastCapsule').span(text: 'Status').click
  end

  def write_status(message)
    @browser.textarea(name: 'xhpc_message_text').set(message)
  end

  def post_status()
    @browser.div(class: '_1dsp _4-').button(text: 'Post').click
    @browser.div(class: '_1dsp _4-').button(text: 'Post').wait_while_present
  end  
end
