class Post < ActiveRecord::Base
  attr_accessible :text, :title, :admin_id

  belongs_to :admin
  validates :admin_id, presence: true
end
