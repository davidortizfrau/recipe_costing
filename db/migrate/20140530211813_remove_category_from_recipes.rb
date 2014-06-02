class RemoveCategoryFromRecipes < ActiveRecord::Migration
  def up
    remove_column :recipes, :category
  end

  def down
    add_column :recipes, :category, :string
  end
end
