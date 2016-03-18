class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :photoheader, :string 
  end
end
