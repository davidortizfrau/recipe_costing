class Ingredient < ActiveRecord::Base
  attr_accessible :category, :inventory, :name, :price, :purveyor, :storage, 
                  :unit, :yield, :ounces_per_cup

  
  

  default_scope order: :name							

  

  # Class instance variables

  @categories = %w(dairy vegetables meats seafood poultry 
  								 fruits spices 
  								 dry canned other)

  @units = %w(ea oz # fl_oz cup pint quart gallon Tbsp tsp)
  
  class << self
  	attr_accessor :categories, :units
  end

  # End of class instance variables



end
