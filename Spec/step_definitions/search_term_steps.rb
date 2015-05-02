steps_for :search_term do
  step "I am logged in" do
    @app.login.visit
    @app.login.login('ninistudies@gmail.com', 'Pass123w')
    @app.home.visit
  end
  
  step "I search for :term" do |term|
    @app.taskbar.search term
  end
  
  step "I should see a list of results relevant to :term" do |term|
    @app.results.check_relevant term
  end
end
