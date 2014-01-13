class AddCategoryToPlates < ActiveRecord::Migration
  def change
    add_column :plates, :category, :string
  end
end
