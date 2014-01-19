class AddCounterToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :counter, :integer, :default => 0
    add_column :answers, :user_id, :integer
  end
end
