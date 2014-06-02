class Ingredient < ActiveRecord::Base
  
  attr_accessible :name, :ingredient_category_id, :price,  
                  :unit, :yield, :ounces_per_cup
                  # :inventory, :purveyor, :storage
  # Validations
  validates :name, presence: true
  validates :user_id, presence: true

  # Relationships
  belongs_to :user
  belongs_to :category, class_name: "IngredientCategory"
  has_many :recipe_ingredients, :dependent => :destroy
  has_many :plate_ingredients, :dependent => :destroy
  
  default_scope order("name, ingredient_category_id")							

  # Class instance variables
  @categories = %w(dairy vegetables meats fruits spices).sort

  @units = %w(oz # fl_oz cup pint quart gallon Tbsp tsp ea pack head can bunch)
  
  class << self
  	attr_accessor :categories, :units
  end
  # End of class instance variables

end