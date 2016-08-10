class Comment < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  def self.avg_rating product_id
    self.where(product_id: product_id).average("vote")
  end
end
