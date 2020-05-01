class Movie < ApplicationRecord
  validates :title, presence:true, length:{ maximum:255 }

  belongs_to :user
  has_many :ratings, dependent: :destroy
end
