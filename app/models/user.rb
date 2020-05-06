class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_writer :login
  validates :name, presence: true, length: { maximum: 100 }
  validates :username, presence: true, length: { minimum: 3, maximum: 50 }, uniqueness: { case_sensitive: false },
                       format: { with: /^[a-zA-Z0-9_\.]*$/,
                                 multiline: true, message: 'Only allows letters, numbers, underscore and punctuation' }
  validates :email, length: { maximum: 100 }
  has_one_attached :avatar

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }

  has_many :movies
  has_many :ratings, dependent: :destroy

  has_many :followers, class_name: 'Following', foreign_key: 'followed_id', dependent: :destroy
  has_many :followings, class_name: 'Following', foreign_key: 'follower_id', dependent: :destroy

  def login
    @login || username || email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h)
        .where(['lower(username) = :value OR lower(email) = :value', { value: login.downcase }]).first
    elsif conditions.key?(:username) || conditions.key?(:email)
      where(conditions.to_h).first
    end
  end

  def non_following
    following_users = followings.collect(&:followed_id) << id
    User.where.not(id: following_users)
  end

  def following_users
    following_users = followers.collect(&:follower_id)
    User.where(id: following_users)
  end

  def following?(user)
    followings.include?(user)
  end
end
