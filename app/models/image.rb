class Image < ActiveRecord::Base
  belongs_to :product
  has_attached_file :image,
                    styles: { large: "600x600>", medium: "300x300>", thumb: "150x150>" },
                    :path => ":rails_root/public/images/:id/:style/:filename",
                    :url  => "/images/:id/:style/:filename"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  #validate
  validates_presence_of :image, :on => :create
end
