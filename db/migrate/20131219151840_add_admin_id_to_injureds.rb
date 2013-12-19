class AddAdminIdToInjureds < ActiveRecord::Migration
  def change
    add_column :injureds, :admin_id, :integer
  end
end
