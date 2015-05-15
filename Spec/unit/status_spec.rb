describe 'Status' do

  let(:app){'app'}
  let(:status){Status.new(app, 'Nini', 'Home Page Feature')}

  describe 'The status class handles the interactions with the status feature' do
    it "should generate a message relevent to status" do
      status
      expect(status.message).to include('This is a status on')
    end
  end
end