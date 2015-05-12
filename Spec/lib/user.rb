class User
  attr_reader :user, :email, :firstname, :lastname, :fullname, :users
  attr_accessor :friends

  @@users = Hash.new

  def initialize(app, user)
    @account = YAML.load(File.open('account.yml'))
    @email = @account[user]['email']
    @firstname = @account[user]['firstname']
    @lastname = @account[user]['lastname']
    @fullname = @firstname + ' ' + @lastname
    @user = user
    @app = app
    instance_status @user
  end

  def instance_status(user)
    if @@users.has_key?(user.to_sym)
      @friends = @@users[user.to_sym].friends
    else
      @friends = []
      @@users[user.to_sym] = self
    end
  end

  def login()
    if @app.taskbar.login_session == false
      @app.login.visit
    end
    @app.login.login @email
  end

  def self.all()
    @@users
  end

  def self.get_instance(user)
    @@users.each do |key, value|
      if key == user.to_sym
        return value
      end
    end
  end

  def add_friend(friend)
    validate friend
    new_friendship friend
    login
    @app.taskbar.search friend.fullname
    @app.friend.send_friend_request
    friend.login
    @app.friend_request.visit
    @app.friend_request.approve @fullname
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
    @friends << friend
    friend.friends << self
  end

  def remove_all_friends()
    unless @friends.empty?
      login
      @friends.each do |friend|
        @app.taskbar.search friend.fullname
        @app.friend.unfriend
      end
    end
  end

  def remove_friend(friend)
    validate friend
    login
    @app.taskbar.search friend.fullname
    @app.friend.unfriend
  end

  def validate(friend)
    if friend.is_a?(User) == false
      raise 'Argument parsed is not an instance of class User'
    end
    if friend.email == @email
      raise 'Users cannot belong to their own friend list'
    end
  end
end