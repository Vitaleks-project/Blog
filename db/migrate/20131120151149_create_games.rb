class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :location
      t.string :total
      t.integer :admin_id

      t.timestamps
    end
  end
end
