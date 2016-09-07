require 'rails_helper'
# let(:valid_session) { {} }
RSpec.describe ProductsController, type: :controller do
  describe "GET #index" do
    it "assigns all products as @product" do
      product = FactoryGirl.create(:product,
                                name: "Head Buster",
                                description: "Quan Ao",
                                status: 1,
                                category_id: 1,
                                price: 1000000,
                                avatar: File.new(Rails.root + 'spec/fixtures/images/rails.png'))
      get :index
      expect(assigns(:products)).to eq([product])
    end
  end
end
