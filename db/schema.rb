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

ActiveRecord::Schema.define(:version => 20140530213719) do

  create_table "ingredient_categories", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "ingredient_categories", ["user_id"], :name => "index_ingredient_categories_on_user_id"

  create_table "ingredients", :force => true do |t|
    t.string   "name"
    t.decimal  "price"
    t.string   "unit"
    t.decimal  "yield"
    t.string   "purveyor"
    t.decimal  "inventory"
    t.string   "storage"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.decimal  "ounces_per_cup"
    t.integer  "user_id"
    t.integer  "ingredient_category_id"
  end

  add_index "ingredients", ["ingredient_category_id"], :name => "index_ingredients_on_ingredient_category_id"
  add_index "ingredients", ["user_id"], :name => "index_ingredients_on_user_id"

  create_table "plate_categories", :force => true do |t|
    t.string  "name"
    t.integer "user_id"
  end

  add_index "plate_categories", ["user_id"], :name => "index_plate_categories_on_user_id"

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

  create_table "plate_ingredients", :force => true do |t|
    t.decimal  "quantity"
    t.string   "unit"
    t.integer  "plate_id"
    t.integer  "ingredient_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "plate_ingredients", ["ingredient_id"], :name => "index_plate_ingredients_on_ingredient_id"
  add_index "plate_ingredients", ["plate_id"], :name => "index_plate_ingredients_on_plate_id"

  create_table "plates", :force => true do |t|
    t.string   "name"
    t.decimal  "sales_price"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "user_id"
    t.integer  "plate_category_id"
  end

  add_index "plates", ["plate_category_id"], :name => "index_plates_on_plate_category_id"
  add_index "plates", ["user_id"], :name => "index_plates_on_user_id"

  create_table "recipe_categories", :force => true do |t|
    t.string  "name"
    t.integer "user_id"
  end

  add_index "recipe_categories", ["user_id"], :name => "index_recipe_categories_on_user_id"

  create_table "recipe_components", :force => true do |t|
    t.decimal  "quantity"
    t.string   "unit"
    t.integer  "recipe_id"
    t.integer  "component_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "recipe_ingredients", :force => true do |t|
    t.decimal  "quantity"
    t.string   "unit"
    t.integer  "recipe_id"
    t.integer  "ingredient_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "recipe_ingredients", ["ingredient_id"], :name => "index_components_on_ingredient_id"
  add_index "recipe_ingredients", ["recipe_id"], :name => "index_components_on_recipe_id"

  create_table "recipes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.decimal  "yield"
    t.string   "yield_unit"
    t.integer  "user_id"
    t.integer  "recipe_category_id"
  end

  add_index "recipes", ["recipe_category_id"], :name => "index_recipes_on_recipe_category_id"
  add_index "recipes", ["user_id"], :name => "index_recipes_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "remember_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
