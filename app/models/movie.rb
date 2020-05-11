class Movie < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }

  belongs_to :user
  has_many :ratings, dependent: :destroy

  scope :ordered_by_most_recent, -> { order(updated_at: :desc) }

  def movie_rating
    ratings.collect(&:rating)[0]
  end
  
  def average_rating(movie)
    Rating.where(movie_id:Movie.where(title:movie.title)).average(:rating).to_i
  end

end
