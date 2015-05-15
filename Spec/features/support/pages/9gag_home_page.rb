class Home9GagPage < Generic
  def visit()
    @browser.goto 'http://9gag.com'
  end

  def get_post_title()
    @browser.h2s(class: 'badge-item-title')[0].wait_until_present
    return @browser.h2s(class: 'badge-item-title')[0].text
  end

  def open_share_form()
    @browser.divs(class: 'share right')[0].a(class: 'facebook').click
  end

  def submit_share_form(post_title)
    @browser.window(title: "Facebook").use do
      @browser.textarea(name: 'message_text').wait_until_present
      @browser.textarea(name: 'message_text').set post_title
      @browser.div(id: 'sharerDialogButtons').button(name: 'share').click
    end
    @browser.divs(class: 'share right')[0].a(class: 'facebook').wait_until_present
  end
end