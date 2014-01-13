class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.decimal :quantity
      t.string :unit
      t.references :recipe
      t.references :ingredient

      t.timestamps
    end
    add_index :components, :recipe_id
    add_index :components, :ingredient_id
  end
end
