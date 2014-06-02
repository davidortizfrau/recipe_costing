class AddCategoryToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :recipe_category_id, :integer
    add_index :recipes, :recipe_category_id
  end
end
