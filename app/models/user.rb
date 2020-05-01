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

  has_many :followings, foreign_key:'followed_id'
  has_many :followers, class_name:'Following', foreign_key:'follower_id'

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

end
