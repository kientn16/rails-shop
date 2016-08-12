class User < ActiveRecord::Base
  validates_presence_of :email,:name
  validates_presence_of :password_digest
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  has_many :comments
  has_many :orders
  has_secure_password


  def admin?
    self.role == 1
  end

end
