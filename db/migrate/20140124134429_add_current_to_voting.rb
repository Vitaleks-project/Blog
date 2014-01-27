class AddCurrentToVoting < ActiveRecord::Migration
  def change
    add_column :votings, :current, :boolean,  :default => false
  end
end
