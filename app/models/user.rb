class User < ActiveRecord::Base
  has_many :comments
  has_many :orders
  has_secure_password

  def admin?
    self.role == 1
  end
end
