class AddPlateCategoryToPlates < ActiveRecord::Migration
  def change
    add_column :plates, :plate_category_id, :integer
    add_index :plates, :plate_category_id
  end
end
