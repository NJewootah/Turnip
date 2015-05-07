class ProfilePage < Generic
  def visit()
   @browser.span(class: '_2dpb').click
  end

  def new_status(message)
    status_tab
    write_post(message)
    post
  end

  def delete_status(message)
    find_post(message)
    delete_post
  end

  def status_tab()
    @browser.div(class: 'lastCapsule').span(text: 'Status').wait_until_present
    @browser.div(class: 'lastCapsule').span(text: 'Status').click
  end

  def write_post(message)
    @browser.textarea(name: 'xhpc_message_text').set(message)
  end

  def post()
    @browser.div(class: '_1dsp _4-').button(text: 'Post').click
    @browser.div(class: '_1dsp _4-').button(text: 'Post').wait_while_present
  end

  def find_post(message)
    @browser.div(class: '_5pbx userContent').p(text: message).wait_until_present
    @browser.divs(class: '_5pbx userContent').each_with_index do |status, i|
      if status.text == message
        @browser.as(class: '_5pbj _p')[i].click
        break
      end
    end
  end

  def delete_post()
    @browser.divs(class: 'uiContextualLayerPositioner uiLayer').last.span(text: 'Delete').click
    @browser.div(class: '_5lnf uiOverlayFooter _5a8u').button(text: 'Delete Post').click
    @browser.div(class: '_5lnf uiOverlayFooter _5a8u').button(text: 'Delete Post').wait_while_present
  end
end
