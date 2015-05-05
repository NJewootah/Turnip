MESSAGE = 'This is my status ' + rand(999).to_s

steps_for :status do
  step "I create my status" do
    @app.profile.visit
    @app.profile.new_status MESSAGE
    @app.taskbar.logout
  end

  step "my friends should see my created status on their homepage" do
    @app.login.login 'Neermal'
    @app.home.visit
    @app.home.check_status_exist MESSAGE
    @app.taskbar.logout
  end
end
