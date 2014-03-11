class CreateClubStatistics < ActiveRecord::Migration
  def change
    create_table :club_statistics do |t|
      t.integer :season_id
      t.integer :admin_id
      t.integer :club_id
      t.integer :win
      t.integer :draw
      t.integer :lost
      t.integer :played_games
      t.integer :points

      t.timestamps
    end
  end
end
