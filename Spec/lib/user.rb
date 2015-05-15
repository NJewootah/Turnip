# Object Representing Users in the Facebook Interface
# -----------------------------------------------------------------------------
# Authors: Neermal Jewootah (njewootah@spartaglobal.com)
# Date Modified: 13-05-2015
# -----------------------------------------------------------------------------

class User
  attr_reader :email, :fullname, :friends
  @@users = Hash.new

  def initialize(app, id)
    @app = app
    @id = id
    control_instance

    user_data = YAML.load(File.open('account.yml'))
    raise "User ID provided doesn't exist in account.yml" unless user_data[id] != nil
    @email = user_data[id]['email']
    @firstname = user_data[id]['firstname']
    @lastname = user_data[id]['lastname']
    @fullname = @firstname + ' ' + @lastname
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

  def self.exist?(user)
    if @@users.has_key?(user.to_sym)
      true
    else
      false
    end
  end

  def control_instance()
    if User.exist?(@id)
      return @@users[@id.to_sym]
    else
      @friends = []
      @@users[@id.to_sym] = self
    end
  end
end