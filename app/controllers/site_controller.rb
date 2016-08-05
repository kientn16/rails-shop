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
end
