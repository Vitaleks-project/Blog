class RemoveFieldTotalFromGame < ActiveRecord::Migration
  def up
    remove_column :games, :total
  end
end
