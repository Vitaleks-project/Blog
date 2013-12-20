class RemoveFieldPlayerIdFromInjured < ActiveRecord::Migration
  def up
    remove_column :injureds, :player_id
  end
end
