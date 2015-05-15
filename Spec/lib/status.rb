# Object Representing Users' status' in the Facebook Interface
# -----------------------------------------------------------------------------
# Authors: Neermal Jewootah (njewootah@spartaglobal.com)
# Date Modified: 14-05-2015
# -----------------------------------------------------------------------------

class Status < TimelinePost
  @@posts = Hash.new

  def initialize(app, id, message)
    super(app, id)
    @message = generate_message(message)
  end

  def create()
    @user.login
    @app.profile.visit
    @app.profile.status_tab
    submit_post
    @@posts[message.to_sym] = self
  end

  def generate_message(message)
    "This is a status on #{message} #{rand(999)}"
  end

  def self.all()
    @@posts
  end
end