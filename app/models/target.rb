class Target < ActiveRecord::Base
  attr_accessible :admin_id, :answer_id, :user_id, :voting_id
  belongs_to :admin
  belongs_to :user
  belongs_to :answer
  belongs_to :voting

  validates :answer_id, presence: true
end
