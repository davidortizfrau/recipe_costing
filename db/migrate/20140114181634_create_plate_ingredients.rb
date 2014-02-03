class CreatePlateIngredients < ActiveRecord::Migration
  def change
    create_table :plate_ingredients do |t|
      t.decimal :quantity
      t.string :unit
      t.references :plate
      t.references :ingredient

      t.timestamps
    end
    add_index :plate_ingredients, :plate_id
    add_index :plate_ingredients, :ingredient_id
  end
end
