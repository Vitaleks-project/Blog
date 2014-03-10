class Season < ActiveRecord::Base
  attr_accessible :admin_id, :game_id, :title
  has_many :games, :dependent => :destroy

  validates :title, presence: true
end
