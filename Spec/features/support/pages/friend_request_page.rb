class FriendRequestPage < Generic
  def visit()
    @browser.goto 'https://www.facebook.com/friends/requests/?fcref=jwl'
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