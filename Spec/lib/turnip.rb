module Turnip
  module Steps
    step "I am logged in as :user" do |user|
    p_user = User.get_instance(user)
    p_user.login
    end
  end
end