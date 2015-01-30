class User < ActiveRecord::Base
  has_secure_password

  has_and_belongs_to_many(:followers, join_table: :user_follow_connections, class_name: "User", foreign_key: :owner_id, association_foreign_key: :follower_id)
  has_and_belongs_to_many(:owners, join_table: :user_follow_connections, class_name: "User", foreign_key: :follower_id, association_foreign_key: :owner_id)
  has_many :inner_circles

  before_save {|user| user.email_address = email_address.downcase }

  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email_address, presence: true, uniqueness: true, format: { with: VALID_EMAIL }
  validates :name, presence: true
  validates :password, length: { minimum: 6 }
end
