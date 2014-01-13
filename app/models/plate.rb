class Plate < ActiveRecord::Base
  attr_accessible :name, :sales_price, :category

  has_many :plate_components
  has_many :components

  # Class instance variables

  @categories = %w(appetizer entree dessert)

  class << self
  	attr_accessor :categories
  end

  # End of class instance variables

  def food_cost
  	cost = 0
  	self.plate_components.each do |c|
  		cost += c.cost
  	end
  	cost / self.sales_price * 100
  end
  
end
