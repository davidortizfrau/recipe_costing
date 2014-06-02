class RemoveCategoryFromPlates < ActiveRecord::Migration
  def up
    remove_column :plates, :category
  end

  def down
    add_column :plates, :category, :string
  end
end
