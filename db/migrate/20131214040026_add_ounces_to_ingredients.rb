class AddOuncesToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :ounces_per_cup, :decimal
  end
end
