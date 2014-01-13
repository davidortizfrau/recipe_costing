class RemoveSalesPriceFromRecipes < ActiveRecord::Migration
  def up
    remove_column :recipes, :sales_price
  end

  def down
    add_column :recipes, :sales_price, :decimal
  end
end
