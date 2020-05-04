class Following < ApplicationRecord

  belongs_to :user, foreign_key:'follower_id'
  belongs_to :follower, class_name: 'User'

  validates :follower_id, presence:true
  validates :followed_id, presence:true
end