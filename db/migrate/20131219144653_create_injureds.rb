class CreateInjureds < ActiveRecord::Migration
  def change
    create_table :injureds do |t|
      t.integer :player_id
      t.string :injurious
      t.string :date_and
      t.string :player_name

      t.timestamps
    end
  end
end
