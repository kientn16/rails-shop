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
      redirect_to login_path,:flash => { :error => "Username or Password invalid" }
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
    @user.password = SecureRandom.hex(9)
    @user.email = SecureRandom.hex(9)+"@mail.com"
    @user.provider = auth.provider
    @user.uid = auth.uid
    @user.name = auth.info.name
    @user.oauth_token = auth.credentials.token
    @user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    @user.role = 2
    @user.status = 1
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render json: @user.errors.full_messages.inspect
    end
  end

  def create_frontend
    user = User.find_by_email(params[:email])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      if session[:return_to]
        redirect_to session[:return_to]
      else
        redirect_to root_path
      end

    else
      # If user's login doesn't work, send them back to the login form.
      redirect_to fr_login_path, :flash => { :error => "Username or Password invalid" }
    end
  end

  def destroy_fontend
    session[:user_id] = nil
    session[:order_id] = nil
    session[:return_to] = nil
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    session[:return_to] = nil
    redirect_to login_path, :notice => "Logged out!"
  end
end
