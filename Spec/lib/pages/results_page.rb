class ResultsPage < Generic
  def check_relevant(term)
    @browser.ol(class: 'section-list').h3s(class: 'yt-lockup-title')[0].text.include?(term)
  end
end
