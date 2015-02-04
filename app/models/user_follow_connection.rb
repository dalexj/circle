class UserFollowConnection < ActiveRecord::Base
  belongs_to :owner, class_name: 'User'
  belongs_to :follower, class_name: 'User'
end
