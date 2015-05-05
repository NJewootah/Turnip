class FriendPage < Generic
  def send_friend_request()
    @browser.button(text: 'Add Friend').click
  end

  def unfriend()
    @browser.span(class: '_55pe').span(text: 'Friends').click
    @browser.div(class: 'FriendListActionMenu').span(text: 'Unfriend').click
  end
end