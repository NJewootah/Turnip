MESSAGE = 'STATUS FEATURE: This is my new status'

steps_for :status do
  step "I create my status" do
    @app.profile.visit
    @app.profile.new_status MESSAGE
    @app.taskbar.logout
  end

  step "my friends should see my :type status on their homepage" do |type|
    @app.login.login 'Neermal'
    @app.home.visit
    @app.home.check_status_exist MESSAGE
    @app.taskbar.logout
  end
end
