# Object Representing Users' timeline posts in the Facebook Interface
# -----------------------------------------------------------------------------
# Authors: Neermal Jewootah (njewootah@spartaglobal.com)
# Date Modified: 14-05-2015
# -----------------------------------------------------------------------------

class TimelinePost
  attr_reader :user, :message

  def initialize(app, id)
    @user = Tools.get_user(app, id)
    @app = app
  end

  def new_post()
    unless @created
      create()
      @created = true
    end
  end

  def exist?
    @app.home.check_status_exist(@message)
  end

  def submit_post()
    @app.profile.write_post(@message)
    @app.profile.post
  end

  def delete!
    @user.login
    @app.profile.visit
    @app.profile.find_post(@message)
    @app.profile.delete_post
  end
end