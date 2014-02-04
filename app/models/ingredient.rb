class Ingredient < ActiveRecord::Base
  attr_accessible :category, :inventory, :name, :price, :purveyor, :storage, 
                  :unit, :yield, :ounces_per_cup, :user_id

  validates :name, presence: true
  validates :user_id, presence: true


  # Relationships
  belongs_to :user
  has_many :recipe_ingredients, :dependent => :destroy
  

  default_scope order("name, category")							

  

  # Class instance variables

  @categories = %w(dairy herbs  pasta vegetables meats seafood poultry 
  								 fruits spices dry canned other).sort

  @units = %w(oz # fl_oz cup pint quart gallon Tbsp tsp ea pack head can)
  
  class << self
  	attr_accessor :categories, :units
  end

  # End of class instance variables



end
