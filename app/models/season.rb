class Season < ActiveRecord::Base
  attr_accessible :admin_id, :game_id, :title
  has_many :games, :dependent => :destroy
  has_and_belongs_to_many :club_statistics
  validates :title, presence: true
end
