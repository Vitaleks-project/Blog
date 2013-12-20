class Admin < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
               :recoverable, :rememberable, :trackable, :validatable
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :posts
  has_many :clubs
  has_many :players
  has_many :games
  has_many :injureds
  has_many :comments, :as => :commentable
end
