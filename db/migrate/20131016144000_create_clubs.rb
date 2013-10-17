class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :clubname
      t.string :stadiumname
      t.string :coach
      t.integer :year_of_foundation
      t.string :logo
      t.string :logo_stadium
      t.string :uniq_title
      t.string :description

      t.timestamps
    end
  end
end
