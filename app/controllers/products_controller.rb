class ProductsController < ApplicationController
  before_filter :authorize
  before_action :require_admin
  helper_method :get_data_cate_all,:get_data_cate
  def index
    @product = Product.searchAdmin(params).paginate(:page => params[:page], :per_page => 5)
    @search = params || {}
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        if params[:images]
          params[:images].each { |image|
            @product.images.create(image: image)
          }
        end
        format.html {redirect_to @product, notice: 'Product was successfully created'}
        format.json { render :show, status: :created, location: @product}
      else
        format.html { render :new }
        format.json {render json: @product.errors, status: :unprocessable_entity}
      end
    end
  end

  def show
    @product = Product.find(params[:id])
  end


  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    respond_to do |format|
      if @product.update(product_params)
        if params[:images]
          params[:images].each { |image|
            @product.images.create(image: image)
          }
        end
        format.html {redirect_to @product, notice: 'Product was successfully updated'}
        format.json { render :show, status: :ok, location: @product}
      else
        format.html { render :edit }
        format.json {render json: @product.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    check = Product.check_remove(params[:id])
    if check
      @data = Product.find(params[:id]).destroy
      redirect_to products_path, notice: 'Product was successfully deleted'
    else
      flash[:warning] = 'Cannot delete Product'
      redirect_to products_path
    end


  end

  def get_data_cate_all
    @dataParent = Category.all
  end

  def get_data_cate (id)
    @data = Category.find(id)
    return @data
  end

  private
  def product_params
    params.require(:product).permit(:name,:avatar,:description,:category_id,:status,:price)
  end
end
