class User < ActiveRecord::Base
  has_secure_password
  has_attached_file :resume

  has_and_belongs_to_many(:followers, join_table: :user_follow_connections, class_name: 'User', foreign_key: :owner_id, association_foreign_key: :follower_id)
  has_and_belongs_to_many(:owners, join_table: :user_follow_connections, class_name: 'User', foreign_key: :follower_id, association_foreign_key: :owner_id)
  has_many :inner_circles

  before_save { |user| user.email_address = email_address.downcase }

  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_RESUME = /\Aimage\/.*\Z/
  validates :email_address, presence: true,
                            uniqueness: true,
                            format: { with: VALID_EMAIL }
  validates :name, presence: true
  validates :password, length: { minimum: 6 }
  validates_attachment :resume,
                       content_type: { content_type: VALID_RESUME },
                       size: { less_than: 1.megabytes }

  def candidates
    followers.where(candidate: true)
  end
end
