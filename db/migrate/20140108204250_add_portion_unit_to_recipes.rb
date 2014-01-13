class AddPortionUnitToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :portion_unit, :string
  end
end
