class SiteController < ApplicationController
  layout 'layout_frontend'
  def index
    # @products = Product.where('status = 1').order('created_at desc').paginate(:page => params[:page], :per_page => 10)
    @products = Product.search(params).paginate(:page => params[:page], :per_page => 9)
    @order_item = current_order.order_items.new
    @search = params || {}
  end

  def show
    session[:return_to] = request.original_url
    @product = Product.find(params[:id])
    @comments = Comment.where("product_id = #{params[:id]}").order('created_at desc').paginate(:page => params[:page_comment], :per_page => 5)
    @avg_rating = Comment.avg_rating(params[:id])
    @order_item = current_order.order_items.new
  end

  def show_cate
    @category = Category.find(params[:id])
    # @products = Product.where("category_id = #{params[:id]}")
    @products = Product.search(params)
    @order_item = current_order.order_items.new
    @search = params || {}
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



  def post_comment
    @params = params[:comment]
    if @params['product_id']
      @product = Product.find(@params['product_id'])
      @product.comments.create(content: @params[:content], vote: @params[:vote], user_id: current_user.id)
      redirect_to :back, notice: 'Comment was successfully created'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def comment_params
    params.require(:comment).permit(:content,:vote,:user_id,:product_id)
  end
end
