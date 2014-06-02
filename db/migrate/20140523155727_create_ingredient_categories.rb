class CreateIngredientCategories < ActiveRecord::Migration
  def change
    create_table :ingredient_categories do |t|
      t.string :name
      t.references :user

      t.timestamps
    end
    add_index :ingredient_categories, :user_id
  end
end
