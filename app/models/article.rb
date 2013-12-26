class Article < ActiveRecord::Base
  attr_accessible :admin_id, :approved, :text, :title, :user_id, :image

  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :admin
  has_many :comments, :as => :commentable, :dependent => :destroy
  has_many :impressions, :as=>:impressionable

  validates :text, :title, presence: true

  def impression_count
    impressions.size
  end

  def unique_impression_count
    impressions.group(:ip_address).size
  end

  def self.disapproved
    Article.scoped_by_approved(false)
  end

  def self.approved
    Article.scoped_by_approved(true)
  end

  def comments_ordered_by_submitted
    Comment.find_comments_for_commentable(self.class.name, id)
  end

  def add_comment(comment)
    comments << comment
  end

  def self.find_comments_for(obj)
    Comment.find_comments_for_commentable(self.to_s, obj.id)
  end

  def self.find_comments_by_user(user)
    Comment.where(["user_id = ? and commentable_type = ?", user.id, self.to_s]).order("created_at DESC")
  end

  def self.search(search)
    where('title LIKE ?',  "%#{search}%")
  end
end
