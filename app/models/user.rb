class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :image, :banned
  mount_uploader :image, ImageUploader
  acts_as_voter
  has_many :comments, :as => :commentable, :dependent => :destroy
  has_many :articles
  has_many :targets, :dependent => :destroy
  validates :email, presence: true

  def self.search(search)
    where('name LIKE ?', "%#{search.downcase}%")
    where('email LIKE ?', "%#{search.downcase}%")
  end
end
