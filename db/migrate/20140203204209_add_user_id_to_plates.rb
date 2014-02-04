class AddUserIdToPlates < ActiveRecord::Migration
  def change
    add_column :plates, :user_id, :integer
    add_index :plates, :user_id
  end
end
