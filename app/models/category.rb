class Category < ActiveRecord::Base
  validates_presence_of :name
  validates_length_of :name, :maximum => 200
  has_many :products
end
