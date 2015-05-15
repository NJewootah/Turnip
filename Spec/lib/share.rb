# Object Representing Users' shared posts in the Facebook Interface
# -----------------------------------------------------------------------------
# Authors: Neermal Jewootah (njewootah@spartaglobal.com)
# Date Modified: 14-05-2015
# -----------------------------------------------------------------------------

class Share < TimelinePost
  @@share = Hash.new

  def initialize(app, id)
    super
  end

  def create()
    @message = get_message
    @app.home_9gag.open_share_form
    @app.home_9gag.submit_share_form(@message)
    @app.home.visit
    @@share[message.to_sym] = self
  end

  def get_message()
    @user.login
    @app.home_9gag.visit
    @app.home_9gag.get_post_title
  end

  def self.all()
    @@share
  end
end