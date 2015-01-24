class User < ActiveRecord::Base
  has_secure_password
  has_many :followers, through: :user_follow_connections, source: :follower_id
  has_many :owners, through: :user_follow_connections, source: :owner_id

  before_save {|user| user.email_address = email_address.downcase }


  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email_address, presence: true, uniqueness: true, format: { with: VALID_EMAIL }
  validates :name, presence: true
  validates :password, length: { minimum: 6 }

  has_many :inner_circles
end
