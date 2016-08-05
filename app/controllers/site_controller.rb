class SiteController < ApplicationController
  layout 'layout_frontend'
  def index

    @products = Product.where('status = 1')
  end

  def show

  end
end
