class Plate < ActiveRecord::Base
  attr_accessible :name, :sales_price, :category

  has_many :plate_components
  has_many :plate_ingredients

  # Class instance variables

  @categories = %w(appetizer entree dessert)
  @units = %w(portion ea oz # fl_oz cup pint quart Tbsp tsp)

  class << self
  	attr_accessor :categories, :units
  end

  # End of class instance variables

  def total_cost
    cost = 0
    self.plate_components.each do |c|
      cost += c.cost
    end
    self.plate_ingredients.each do |c|
      cost += c.price
    end

    cost
  end

  def food_cost
  	cost = self.total_cost
  	cost / self.sales_price * 100
  end
  
end
