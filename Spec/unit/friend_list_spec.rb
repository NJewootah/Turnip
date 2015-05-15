describe 'Friend List' do

  let(:app){'app'}
  let(:nini){FriendList.new(app, 'Nini')}
  let(:nini2){FriendList.new(app, 'Nini')}
  let(:neermal){FriendList.new(app, 'Neermal')}
  let(:nini_fullname){'Nini Tests'}
  let(:neermal_fullname){'Neermal Tests'}

  describe "The friend list class handles the details of users' friend lists" do
    it "should store and return friends" do
      nini
      neermal
      nini.new_friendship(neermal.user)
      expect(nini.user.friends[0].fullname).to eq(neermal_fullname)
      expect(neermal.user.friends[0].fullname).to eq(nini_fullname)
    end

    it "should delete friends" do
      nini.delete_friendship(neermal.user)
      expect(nini.user.friends).to eq([])
      expect(neermal.user.friends).to eq([])
    end

    it "should raise error when the wrong instance type is parsed" do
      expect{nini.validate('Neermal')}.to raise_error('Argument parsed is not an instance of class User')
    end

    it "should raise error when an attempt to belong to own friend list is made" do
      expect{nini.validate(nini.user)}.to raise_error('Users cannot belong to their own friend list')
    end

    it "should raise error when the wrong number of arguments is parsed" do
      expect{nini.unfriend('arg1', 'arg2')}.to raise_error('Number of arguments parsed is invalid')
    end

    it "should only create one instance of a user account" do
      User.all.delete(:Nini)
      User.all.delete(:Neermal)
      nini
      nini2
      neermal
      expect(nini.user.friends).to eq([])
      nini2.new_friendship(neermal.user)
      expect(nini.user.friends[0].fullname).to eq(neermal_fullname)
    end
  end
end