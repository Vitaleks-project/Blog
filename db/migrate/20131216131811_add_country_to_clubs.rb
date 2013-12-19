class AddCountryToClubs < ActiveRecord::Migration
  def change
    add_column :clubs, :country, :string
  end
end
