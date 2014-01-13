class RemoveQuantityFromPlateComponents < ActiveRecord::Migration
  def up
    remove_column :plate_components, :quantity
  end

  def down
    add_column :plate_components, :quantity, :string
  end
end
