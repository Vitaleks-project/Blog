class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text
      t.integer :admin_id
      t.integer :user_id
      t.boolean :approved, :default => false

      t.timestamps
    end
  end
end
