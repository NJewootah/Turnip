module Turnip
  module Steps
    step "I am logged in" do
    @app.login.visit
    @app.login.login('ninistudies@gmail.com', 'Pass123w')
    @app.home.visit
    end
  end
end