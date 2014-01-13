class CreatePlateComponents < ActiveRecord::Migration
  def change
    create_table :plate_components do |t|
      t.string :quantity
      t.string :unit
      t.references :plate
      t.references :recipe

      t.timestamps
    end
    add_index :plate_components, :plate_id
    add_index :plate_components, :recipe_id
  end
end
