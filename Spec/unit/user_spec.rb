describe 'User' do

  let(:app){'app'}
  let(:nini){User.new(app, 'Nini')}
  let(:nini_fullname){'Nini Tests'}
  let(:nini_email){'ninistudies@gmail.com'}
  let(:neermal){User.new(app, 'Neermal')}
  let(:neermal_fullname){'Neermal Tests'}

  describe 'The user class handles the details of a user account' do
    it "should store and return account information" do
      nini
      expect(nini.fullname).to eq(nini_fullname)
      expect(nini.email).to eq(nini_email)
    end

    it "should retrieve user instances" do
      user = User.get_instance('Nini')
      expect(user.fullname).to eq(nini_fullname)
    end

    it "should store user instances" do
      expect(User.all[:Nini]).to be_a(User)
      expect(User.all[:Nini].fullname).to eq(nini_fullname)
    end

    it "should check if an instance exists" do
      User.all.delete(:Nini)
      expect(User.exist?('Nini')).to eq(false)
      nini
      expect(User.exist?('Nini')).to eq(true)
    end

    it "should check if user exists in account.yml" do
      expect{User.new(app, 'Nini2')}.to raise_error("User ID provided doesn't exist in account.yml")
    end
  end
end