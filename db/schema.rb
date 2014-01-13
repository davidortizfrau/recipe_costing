# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140113175525) do

  create_table "components", :force => true do |t|
    t.decimal  "quantity"
    t.string   "unit"
    t.integer  "recipe_id"
    t.integer  "ingredient_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "components", ["ingredient_id"], :name => "index_components_on_ingredient_id"
  add_index "components", ["recipe_id"], :name => "index_components_on_recipe_id"

  create_table "ingredients", :force => true do |t|
    t.string   "name"
    t.decimal  "price"
    t.string   "unit"
    t.decimal  "yield"
    t.string   "category"
    t.string   "purveyor"
    t.decimal  "inventory"
    t.string   "storage"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.decimal  "ounces_per_cup"
  end

  create_table "plate_components", :force => true do |t|
    t.string   "unit"
    t.integer  "plate_id"
    t.integer  "recipe_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.decimal  "quantity"
  end

  add_index "plate_components", ["plate_id"], :name => "index_plate_components_on_plate_id"
  add_index "plate_components", ["recipe_id"], :name => "index_plate_components_on_recipe_id"

  create_table "plates", :force => true do |t|
    t.string   "name"
    t.decimal  "sales_price"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "category"
  end

  create_table "recipes", :force => true do |t|
    t.string   "name"
    t.decimal  "portions"
    t.decimal  "portion_size"
    t.string   "category"
    t.decimal  "food_cost_percent"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.decimal  "yield"
    t.string   "yield_unit"
    t.string   "portion_unit"
  end

end
