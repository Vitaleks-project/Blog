class ClubsGames < ActiveRecord::Migration
  def self.up
    create_table :clubs_games, :id => false do |t|
      t.column :club_id, :integer
      t.column :game_id, :integer
    end
  end
end
