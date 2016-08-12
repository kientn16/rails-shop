require 'rails_helper'
RSpec.describe Product, :type => :model do
  # before(:each) do
  #   load "#{Rails.root}/db/seeds.rb"
  # end
  # it { is_expected.to validate_presence_of :name }
  # it { is_expected.to validate_presence_of :description }
  # it { is_expected.to validate_presence_of :category_id }
  # it { is_expected.to validate_presence_of :status }
  # it { is_expected.to validate_presence_of :price }

  describe "search" do
    # result_search = Product.where("name LIKE ? AND status = ?", "%Quan%",1).count
    it "return result that match" do
      role = FactoryGirl.create(:product,
                                name: "Head Buster",
                                description: "Quan Ao",
                                status: 1,
                                category_id: 1,
                                price: 1000000,
                                avatar: File.new(Rails.root + 'spec/fixtures/images/rails.png'))
      expect(Product.searchAdmin(:name => "Head",:category_id => 1)).to eq [role]
      # expect(Product.searchAdmin(:name => "Quan",:category_id => 1).count).to eq result_search
    end

    it "not return result if not match" do
      role = FactoryGirl.create(:product,
                                name: "Head Buster",
                                description: "Quan Ao",
                                status: 1,
                                category_id: 1,
                                price: 1000000,
                                avatar: File.new(Rails.root + 'spec/fixtures/images/rails.png'))
      expect(Product.searchAdmin(:name => "!@#",:category_id => 2)).to_not eq [role]
    end
    #
    it "to return all result if not get params" do
      expect(Product.searchAdmin(:name => "",:category_id => "").count).to eq Product.all.count
    end
  end




  #comment
  # context "with 2 or more comments" do
  #   it "orders them in reverse chronologically" do
  #     # post = Product.create!
  #     comment1 = @user.comments.create!(:content => "first comment")
  #     comment2 = @user.comments.create!(:content => "second comment")
  #     expect(@user.reload.comments).to eq([comment2, comment1])
  #   end
  # end

  # describe "SearchTest" do
  #   it "returns a sorted array of results that match" do
  #         quan_bo = Product.create(name: "Quan Ao",
  #                                   description: "Quan Ao",
  #                                   status: 1,
  #                                   category_id: 1,
  #                                   price: 1000000,
  #                                   avatar: File.new(Rails.root + 'spec/fixtures/images/rails.png')
  #         )
  #         ao_bo = Product.create(name: "Ao Bo",
  #                                  description: "Ao bo",
  #                                  status: 1,
  #                                  category_id: 1,
  #                                  price: 1000000,
  #                                  avatar: File.new(Rails.root + 'spec/fixtures/images/rails.png')
  #         )
  #         quan_jean = Product.create(name: "Quan Jean",
  #                                  description: "Quan Jean",
  #                                  status: 1,
  #                                  category_id: 1,
  #                                  price: 1000000,
  #                                  avatar: File.new(Rails.root + 'spec/fixtures/images/rails.png')
  #         )
  #        expect(Product.searchAdmin(:name => "Quan")).to eq [quan_bo, quan_jean]
  #   end
  # end

end