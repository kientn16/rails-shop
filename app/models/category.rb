class Category < ActiveRecord::Base
  validates_presence_of :name
  validates_length_of :name, :maximum => 200
  has_many :products

  def self.search(params)
    if params
      categories = Category.all
      categories = categories.where(["name LIKE ?","%#{params[:name]}%"]) if params[:name].present?
      categories = categories.where(["status = ?","#{params[:status]}"]) if params[:status].present?
      return categories
    else
      Category.all
    end
  end
end
