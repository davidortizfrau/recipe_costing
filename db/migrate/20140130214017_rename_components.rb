class RenameComponents < ActiveRecord::Migration
  def up
  	rename_table :components, :recipe_ingredients
  end

  def down
  	rename_table :recipe_ingredients, :components
  end
end
