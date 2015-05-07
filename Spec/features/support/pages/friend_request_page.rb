class FriendRequestPage < Generic
  def visit()
    @browser.div(id: 'fbRequestsJewel').a(name: 'requests').click
    @browser.div(id: 'fbRequestsFlyout').span(text: 'View all').click
  end

  def approve(user)
    @browser.divs(class: '_6-_')[0].wait_until_present
    @browser.divs(class: '_6-_').each_with_index do |user_name, i|
      if user_name.text == user
        @browser.divs(class: 'ruResponseButtons')[i].button(text: 'Confirm').click
        break
      end
    end
  end
end