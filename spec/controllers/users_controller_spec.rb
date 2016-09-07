require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'GET #index' do
    it "collects users into @users" do
      user = FactoryGirl.create(:user)
      get :index
      expect(assigns(:users)).to match_array [@user,user]
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end
end
