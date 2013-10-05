class Admin < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :remember_me
  has_many :posts
end
