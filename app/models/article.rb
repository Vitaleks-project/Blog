class Article < ActiveRecord::Base
  attr_accessible :admin_id, :approved, :text, :title, :user_id, :image

  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :admin

  validates :text, :title, presence: true

  def self.disapproved
    Article.scoped_by_approved(false)
  end

  def self.approved
    Article.scoped_by_approved(true)
  end
end
