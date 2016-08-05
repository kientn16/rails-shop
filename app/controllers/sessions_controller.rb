class SessionsController < ApplicationController

  def index
    render 'new'
  end
  def new
  end

  def create
    admin = User.find_by_email(params[:email])
    # If the user exists AND the password entered is correct.
    if admin && admin.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = admin.id
      redirect_to categories_path
    else
      # If user's login doesn't work, send them back to the login form.
      redirect_to login_path
    end
  end

  def create_face
    auth = env["omniauth.auth"]
    check = User.find_by_uid(auth.uid)

    #check uid trong he thong
    if check
      @user = User.find_by_uid(auth.uid)
    else
      @user = User.new
    end
    @user.email = ""
    @user.password_digest = ""
    @user.provider = auth.provider
    @user.uid = auth.uid
    @user.name = auth.info.name
    @user.oauth_token = auth.credentials.token
    @user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render json: '111'.inspect
    end


  end

  def destroy_fontend
    session[:user_id] = nil
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, :notice => "Logged out!"
  end
end
