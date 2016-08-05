class User < ActiveRecord::Base
  # has_secure_password
  attr_accessible :name,  :email, :passowrd, :password_digest, :status, :role, :provider, :uid, :oauth_token, :oauth_expires_at
end
