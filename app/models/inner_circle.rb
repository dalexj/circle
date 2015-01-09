class InnerCircle < ActiveRecord::Base
  belongs_to :user
  has_many :warmers
end
