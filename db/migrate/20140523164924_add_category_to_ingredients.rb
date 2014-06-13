class AddCategoryToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :ingredient_category_id, :integer
    add_index :ingredients, :ingredient_category_id
    remove_column :ingredients, :category
  end
end
