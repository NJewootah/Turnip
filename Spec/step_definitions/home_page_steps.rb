steps_for :home_page do
  step "I am on the home page" do
    $app.home.visit
  end

  step "I should see my friend's :content" do |content|
    if content == "posted status"
      $nini_home_page_status.exist?
    else
      $nini_home_page_9gag.exist?
    end
  end
end
