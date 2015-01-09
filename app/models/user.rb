class User < ActiveRecord::Base
  has_secure_password
  before_save {|user| user.email_address = email_address.downcase }

  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email_address, presence: true, uniqueness: true, format: { with: VALID_EMAIL }
  validates :name, presence: true
  validates :password, length: { minimum: 6 }

  has_many :inner_circles
end
