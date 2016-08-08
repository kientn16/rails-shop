class SiteController < ApplicationController
  layout 'layout_frontend'
  def index
    @products = Product.where('status = 1')
  end

  def show
    @product = Product.find(params[:id])
  end

  def show_cate
    @category = Category.find(params[:id])
    @products = Product.where("category_id = #{params[:id]}")
  end

  def login

  end

  def register
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to fr_login_path, notice: 'User was successfully Created'
    else
      redirect_to fr_register_path
    end
  end




  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
