class CreateRecipeCategories < ActiveRecord::Migration
  def change
    create_table :recipe_categories do |t|
      t.string :name
      t.references :user
    end
    add_index :recipe_categories, :user_id
  end
end
