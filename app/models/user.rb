class User < ActiveRecord::Base
  has_many :posts
  acts_as_followable
  acts_as_follower
  attachment :photo
  has_secure_password
  validates :name, :user_name, :email, :password, presence: true
end
