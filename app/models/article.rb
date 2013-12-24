class Article < ActiveRecord::Base
  attr_accessible :admin_id, :approved, :text, :title, :user_id

  belongs_to :user
  belongs_to :admin

  validates :text, :title, presence: true
end
