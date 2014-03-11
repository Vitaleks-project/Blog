class ClubStatistic < ActiveRecord::Base
  attr_accessible :admin_id, :club_id, :draw,
                  :lost, :played_games,
                  :points, :season_id, :win
  has_many :clubs
  has_and_belongs_to_many :seasons
  belongs_to :admin
  has_many :games
end
