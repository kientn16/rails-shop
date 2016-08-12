require 'rails_helper'

RSpec.describe User, type: :model do

    # validation examples ...

    it "returns a sorted array of results that match" do
      smith = FactoryGirl.create(:user, name: "Smith",email: "smith@mail.com", password: SecureRandom.hex(9))
      jones = FactoryGirl.create(:user, name: "Jones",email: "Jones@mail.com", password: SecureRandom.hex(9))
      User.by_letter("J").should == [jones]
    end
end
