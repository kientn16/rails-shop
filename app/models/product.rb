class Product < ActiveRecord::Base
  #validate
  validates_presence_of :name
  validates_length_of :name, :maximum => 200
  validates_presence_of :avatar, :on => :create
  validates_presence_of :description, :category_id, :status, :price
  #upload image
  has_attached_file :avatar, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  #relationship db
  belongs_to :category
  has_many :images
end
