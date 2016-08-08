class User < ActiveRecord::Base
  has_secure_password

  def admin?
    self.role == 1
  end
end
