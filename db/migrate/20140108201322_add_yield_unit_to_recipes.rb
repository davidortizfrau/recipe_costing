class AddYieldUnitToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :yield_unit, :string
  end
end
