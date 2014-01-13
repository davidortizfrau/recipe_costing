class CreatePlates < ActiveRecord::Migration
  def change
    create_table :plates do |t|
      t.string :name
      t.decimal :sales_price

      t.timestamps
    end
  end
end
