class AddQuantityToPlateComponents < ActiveRecord::Migration
  def change
    add_column :plate_components, :quantity, :decimal
  end
end
