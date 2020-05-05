class Movie < ApplicationRecord
  validates :title, presence:true, length:{ maximum:255 }

  belongs_to :user
  has_many :ratings, dependent: :destroy

  scope :ordered_by_most_recent, -> {order(updated_at: :desc)}
end
