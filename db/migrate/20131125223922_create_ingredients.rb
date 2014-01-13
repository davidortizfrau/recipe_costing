class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.decimal :price
      t.string :unit
      t.decimal :yield
      t.string :category
      t.string :purveyor
      t.decimal :inventory
      t.string :storage

      t.timestamps
    end
  end
end
