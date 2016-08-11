class Product < ActiveRecord::Base
  #validate
  validates_presence_of :name
  validates_length_of :name, :maximum => 200
  validates_presence_of :avatar, :on => :create
  validates_presence_of :description, :category_id, :status, :price
  #upload image
  has_attached_file :avatar, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150>" }, default_url: "http://yantrahub.com/news/wp-content/uploads/2016/07/icon-user-default-150x150.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  #relationship db
  belongs_to :category
  has_many :images
  has_many :comments
  has_many :order_items

  # default_scope { where(status: 1) }

  def self.check_remove product_id
    check = OrderItem.find_by_product_id(product_id)
    if check
      return false
    else
      return true
    end
  end


  def self.search(params)
    if params
      products = Product.all.order('created_at desc')
      products = products.where(["name LIKE ? OR description LIKE ?","%#{params[:key_word].strip}%","%#{params[:key_word].strip}%"]) if params[:key_word].present?
      products = products.where(["category_id = ?","#{params[:category_id]}"]) if params[:category_id].present?
      products = products.where(["category_id = ?","#{params[:id]}"]) if params[:id].present?
      return products
    else
      self.where('status = 1').order('created_at desc')
      # return products
    end
  end

  def self.searchAdmin(params)
    if params
      products = Product.all
      products = products.where(["name LIKE ?","%#{params[:name].strip}%"]) if params[:name].present?
      products = products.where(["category_id = ?","#{params[:category_id]}"]) if params[:category_id].present?
      products = products.where(["status = ?","#{params[:status]}"]) if params[:status].present?
      return products
    else
      self.all.order('created_at desc')
    end
  end

  def self.get_product_to_order_id(params)
    Product.joins("INNER JOIN order_items ON order_items.product_id = products.id WHERE order_items.order_id = #{params}")
  end
end
