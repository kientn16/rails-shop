class Order < ActiveRecord::Base
  # skip_before_filter :verify_authenticity_token, :only => [:index, :show]
  belongs_to :order_status
  has_many :order_items
  belongs_to :user
  before_create :set_order_status
  before_save :update_subtotal

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end

  def self.search(params)
    if params
      orders = Order.all
      orders = orders.where(["tax LIKE ?","%#{params[:code].strip}%"]) if params[:code].present?
      orders = orders.where(["order_status_id = ?","#{params[:order_status_id]}"]) if params[:order_status_id].present?
      orders = orders.where(["created_at >= ?","#{params[:start_time]}"]) if params[:start_time].present?
      orders = orders.where(["created_at <= ?","#{params[:end_time]}"]) if params[:end_time].present?
      # binding.pry
      return orders
    else
      self.all
    end

  end

  private
  def set_order_status
    self.order_status_id = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end
end
