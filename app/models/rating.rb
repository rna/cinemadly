class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :user_id, uniqueness: {scope: :movie_id}
  validates_inclusion_of :rating, :in => 1..10
end
