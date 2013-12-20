class Injured < ActiveRecord::Base
  attr_accessible :date_and, :injurious, :player_id, :player_name

  belongs_to :admin

  validates :date_and, :injurious, :player_name, :presence => true
end
