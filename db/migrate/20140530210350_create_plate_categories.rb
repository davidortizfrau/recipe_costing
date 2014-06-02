class CreatePlateCategories < ActiveRecord::Migration
  def change
    create_table :plate_categories do |t|
      t.string :name
      t.references :user
    end
    add_index :plate_categories, :user_id
  end
end
