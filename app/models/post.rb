class Post < ActiveRecord::Base
  attr_accessible :text, :title, :admin_id
  acts_as_commentable

  belongs_to :admin
  validates :admin_id, presence: true
  has_many :comments, :as => :commentable, :dependent => :destroy

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
end
