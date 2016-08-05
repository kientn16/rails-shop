class AdminsController < ApplicationController
  helper_method :get_status,:get_data_roles
  def index
    @admins = Admin.paginate(:page => params[:page],:per_page => 5)
  end
  #show
  def show
  end

  def new
    @admin = User.new
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      redirect_to admins_path
    else
      render 'new'
    end
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    respond_to do |format|
      if @admin.update(admin_params)
        format.html {redirect_to admins_path, notice: 'Admin was successfully updated'}
        format.json { render :index, status: :ok, location: @admin}
      else
        format.html { render :edit }
        format.json {render json: @admin.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @admin = Admin.find(params[:id]).destroy
    redirect_to admins_path, notice: 'Admin was successfully deleted'
  end

  def get_status (status)
    case status
      when 1
        return "Active"
      when 0
        return "Inactive"
    end
  end

  def get_data_roles
    @dataPRole = Role.all
  end
  private
  def admin_params
    params.require(:admin).permit(:username,:password)
  end
end
