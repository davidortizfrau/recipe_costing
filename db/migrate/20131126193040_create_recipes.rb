class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.decimal :portions
      t.decimal :portion_size
      t.string :category
      t.decimal :food_cost_percent
      t.decimal :sales_price

      t.timestamps
    end
  end
end
