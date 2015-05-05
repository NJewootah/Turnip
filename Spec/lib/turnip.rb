module Turnip
  module Steps
    step "I am logged in as :user" do |user|
    @app.login.visit
    @app.login.login user
    end
  end
end