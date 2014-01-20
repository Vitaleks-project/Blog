class CreateTargets < ActiveRecord::Migration
  def change
    create_table :targets do |t|
      t.integer :admin_id
      t.integer :user_id
      t.integer :answer_id
      t.integer :voting_id

      t.timestamps
    end
  end
end
