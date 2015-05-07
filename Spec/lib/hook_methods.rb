module HookMethods
  def add_friend(user, friend)
    @app.login.visit
    @app.login.login user
    @app.taskbar.search friend + ' Tests'
    @app.friend.send_friend_request
    @app.taskbar.logout
    @app.login.visit
    @app.login.login friend
    @app.friend_request.visit
    @app.friend_request.approve user + ' Tests'
    @app.taskbar.logout
  end

  def unfriend(user, friend)
    @app.login.visit
    @app.login.login user
    @app.taskbar.search friend + ' Tests'
    @app.friend.unfriend
    @app.taskbar.logout
  end

  def create_status(message)
    @app.login.visit
    @app.login.login 'Nini'
    @app.profile.visit
    @app.profile.new_status MESSAGE
    @app.taskbar.logout
  end

  def delete_status(message)
    @app.login.visit
    @app.login.login 'Nini'
    @app.profile.visit
    @app.profile.delete_status MESSAGE
    @app.taskbar.logout
  end
end