class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.string :birthday
      t.string :country
      t.string :club
      t.integer :admin_id
      t.string :photo
      t.string :position
      t.integer :number

      t.timestamps
    end
  end
end
