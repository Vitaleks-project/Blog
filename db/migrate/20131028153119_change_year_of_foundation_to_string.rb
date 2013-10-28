class ChangeYearOfFoundationToString < ActiveRecord::Migration
  def up
    change_column :clubs, :year_of_foundation, :string
  end

  def down
    change_column :clubs, :year_of_foundation, :integer
  end
end
