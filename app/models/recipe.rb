class Recipe < ActiveRecord::Base
  attr_accessible :name, :category,
                  :yield, :yield_unit,
                  :portion_size, :portions,
                  :portion_unit, :user_id

  # Validations
  validates :name, presence: true

  # Relationships
  belongs_to :user				  				
  has_many :recipe_ingredients, :dependent => :destroy

  default_scope order: :name

  

  # Class instance variables
  @categories = %w(baking pasta salad).sort
  @units = %w(portion ea oz # fl_oz cup pint quart Tbsp tsp)

  class << self
  	attr_accessor :categories, :units
  end
  # End of class instance variables

  
  def total_cost
  	t_cost = 0
  	self.recipe_ingredients.each do |i|
  		if i.ingredient.price
        t_cost += i.cost
      end
  	end
  	t_cost
  end

  def serving_cost
  	total_cost / self.portions if self.portions
  end


end
