class Comment < ActiveRecord::Base
  attr_accessible :comment, :commentable_id, :commentable_type
  include ActsAsCommentable::Comment

  belongs_to :commentable, :polymorphic => true
  validates :comment, presence: true,
                      :length => {:minimum => 1, :maximum => 254}

  default_scope order: 'comments.created_at DESC'

  def self.find_comments_by_user(user)
    where(["user_id = ?", user.id]).order("created_at DESC")
  end

  def self.find_comments_for_commentable(commentable_str, commentable_id)
    where(["commentable_type = ? and commentable_id = ?", commentable_str, commentable_id]).order("created_at DESC")
  end

  def self.find_commentable(commentable_str, commentable_id)
    commentable_str.constantize.find(commentable_id)
  end

  belongs_to :user
  belongs_to :admin
end
