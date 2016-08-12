require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(name: "Anything", email: "Anything@gmail.com",status: 1, password: SecureRandom.hex(9))
  end

  describe "creation" do
    it "should have one item created after being created" do
      expect(User.all.count).to eq(2)
    end
  end

end
