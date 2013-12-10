class Game < ActiveRecord::Base
  attr_accessible :admin_id, :location, :club_ids, :date, :kind
  belongs_to :admin
  validates :admin_id, :location, :date, :kind, :presence => true
  has_and_belongs_to_many :clubs

  before_save :only_two_clubs

  LOCATION = ["Home", "Away", "Neutral"]

  KIND_GAME = ["Premier League",
               "UEFA Champions League",
               "League Cup",
               "FA Cup",
               "UEFA Europa League",
               "Community Shield",
               "UEFA Super Cup"]


  def only_two_clubs
    if club_ids.size == 2
      return true
    elsif(club_ids.size == 1 || club_ids.size > 2 || club_ids.size == 0 )
      errors.add(:base, 'You must select two clubs for game')
      return false
    end
  end
end
