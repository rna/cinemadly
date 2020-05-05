class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_writer :login
  validates :name, presence:true, length: { maximum: 100 }
  validates :username, presence: true, length: {minimum:3, maximum:50}, uniqueness: { case_sensitive: false },
                format: {with: /^[a-zA-Z0-9_\.]*$/, multiline:true, message:"Only allows letters, numbers, underscore and punctuation"}
  validates :email, length: { maximum:100 }
  has_one_attached :avatar

  has_many :movies
  has_many :ratings, dependent: :destroy

  has_many :followers, foreign_key:'followed_id',dependent: :destroy
  has_many :followings, class_name:'Following', foreign_key:'follower_id', dependent: :destroy

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

  def following(user)
    following_users = Following.where(follower_id:user.id).collect(&:followed_id).compact
    User.where(id:following_users)
  end

  def non_following(user)
    following_users = Following.where(follower_id:user.id).collect(&:followed_id).compact << user.id
    User.where.not(id:following_users)
  end

  
  
end
