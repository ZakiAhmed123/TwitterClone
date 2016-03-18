class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :text
      t.integer :user_id
      t.integer :view_count, default: 0
      t.timestamps null: false
    end
  end
end
