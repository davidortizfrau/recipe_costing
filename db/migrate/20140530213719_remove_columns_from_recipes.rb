class RemoveColumnsFromRecipes < ActiveRecord::Migration
  def up
    remove_column :recipes, :portions
    remove_column :recipes, :portion_size
    remove_column :recipes, :food_cost_percent
    remove_column :recipes, :portion_unit
  end

  def down
    add_column :recipes, :portion_unit, :string
    add_column :recipes, :food_cost_percent, :string
    add_column :recipes, :portion_size, :string
    add_column :recipes, :portions, :string
  end
end
