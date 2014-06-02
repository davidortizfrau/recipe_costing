class CreateRecipeComponents < ActiveRecord::Migration
  def change
    create_table :recipe_components do |t|
      t.decimal :quantity
      t.string :unit
      t.integer :recipe_id
      t.integer :component_id

      t.timestamps
    end
  end
end
