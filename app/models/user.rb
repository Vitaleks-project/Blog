class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :image
  mount_uploader :image, ImageUploader
  has_many :comments, :as => :commentable, :dependent => :destroy
  validates :email, presence: true
end
