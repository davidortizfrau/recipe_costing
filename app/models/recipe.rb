class Recipe < ActiveRecord::Base
  attr_accessible :name, :category,
                  :yield, :yield_unit,
                  :portion_size, :portions,
                  :portion_unit

  								
  has_many :recipe_ingredients, :dependent => :destroy

  default_scope order: :name

  # Class instance variables

  @categories = %w(sauces dressings dumplings salads sausage)

  class << self
  	attr_accessor :categories
  end

  # End of class instance variables

  def total_cost
  	t_cost = 0
  	self.recipe_ingredients.each do |c|
  		t_cost += c.price
  	end
  	t_cost
  end

  def serving_cost
  	total_cost / self.portions if self.portions
  end


end
