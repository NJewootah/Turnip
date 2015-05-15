module Tools
  def self.get_user(app, id)
    User.new(app, id)
    User.all[id.to_sym]
  end
end