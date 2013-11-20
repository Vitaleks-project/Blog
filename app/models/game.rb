class Game < ActiveRecord::Base
  attr_accessible :admin_id, :location, :total, :club_ids
  belongs_to :admin
  validates :admin_id, :location, :total, :club_ids, :presence => true
  has_and_belongs_to_many :clubs
end
