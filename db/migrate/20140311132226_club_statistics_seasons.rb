class ClubStatisticsSeasons < ActiveRecord::Migration
  def self.up
    create_table :club_statistics_seasons, :id => false do |t|
      t.column :club_statistic_id, :integer
      t.column :season_id, :integer
    end
  end
end
