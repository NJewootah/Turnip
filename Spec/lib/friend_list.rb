# Object Representing Users' friend list in the Facebook Interface
# -----------------------------------------------------------------------------
# Authors: Neermal Jewootah (njewootah@spartaglobal.com)
# Date Modified: 13-05-2015
# -----------------------------------------------------------------------------

class FriendList
  attr_reader :user

  def initialize(app, id)
    @app = app
    @id = id
    @user = Tools.get_user(app, id)
  end

  def add_friend(friend)
    validate friend
    new_friendship friend
    @user.login
    @app.taskbar.search friend.fullname
    @app.friend.send_friend_request
    friend.login
    @app.friend_request.visit
    @app.friend_request.approve @user.fullname
  end

  def unfriend(*args)
    if args.size == 0
      remove_all_friends
    elsif args.size == 1
      remove_friend args[0]
    else
      raise 'Number of arguments parsed is invalid'
    end
  end

  def new_friendship(friend)
    @user.friends << friend
    friend.friends << @user
  end

  def delete_friendship(friend)
    @user.friends.delete(friend)
    friend.friends.delete(@user)
  end

  def remove_all_friends()
    unless @user.friends.empty?
      @user.login
      @user.friends.each do |friend|
        @app.taskbar.search friend.fullname
        @app.friend.unfriend
        delete_friendship(friend)
      end
    end
  end

  def remove_friend(friend)
    validate friend
    @user.login
    @app.taskbar.search friend.fullname
    @app.friend.unfriend
    delete_friendship(friend)
  end

  def validate(friend)
    if friend.is_a?(User) == false
      raise 'Argument parsed is not an instance of class User'
    end
    if friend.email == @user.email
      raise 'Users cannot belong to their own friend list'
    end
  end
end