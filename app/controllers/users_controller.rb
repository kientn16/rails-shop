class UsersController < ApplicationController
  before_filter :authorize, :only => ['index','edit']
  helper_method :get_role,:get_status
  def index
    @user = User.paginate(:page => params[:page],:per_page => 5)
  end

  def new

  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to login_path, notice: 'User was successfully Created'
    else
      redirect_to get_signup_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # Handle a successful update.
      redirect_to users_path, notice: 'User was successfully updated'
    else
      Rails.logger.info(@user.errors.messages.inspect)
      render 'edit'
    end
  end

  def show

  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation,:status,:role)
  end

  def get_role(role)
    case role
      when 1
        return "Admin"
      when 2
        return "User"
    end
  end

  def get_status (status)
    case status
      when 1
        return "Active"
      when 0
        return "Inactive"
    end
  end
end
