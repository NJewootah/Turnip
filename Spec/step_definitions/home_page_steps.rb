MESSAGE = 'STATUS FEATURE: This is my new status'

steps_for :home_page do
  step "I am on the home page" do
    @app.home.visit
  end

  step "I should see my friend's posted status" do
    @app.home.check_status_exist MESSAGE
    @app.taskbar.logout
  end
end
