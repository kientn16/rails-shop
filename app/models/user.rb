class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :email
  # validates_presence_of :password_digest
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  has_many :comments
  has_many :orders
  # has_secure_password


  def admin?
    self.role == 1
  end


  def self.by_letter(letter)
    where("name LIKE ?", "#{letter}%").order(:name)
  end
end
