class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.string :title
      t.integer :admin_id
      t.integer :game_id

      t.timestamps
    end
  end
end
