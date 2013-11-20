class AddClubIdsToGame < ActiveRecord::Migration
  def change
    add_column :games, :club_ids, :integer
  end
end
