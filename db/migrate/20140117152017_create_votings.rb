class CreateVotings < ActiveRecord::Migration
  def change
    create_table :votings do |t|
      t.string :title
      t.integer :admin_id

      t.timestamps
    end
  end
end
