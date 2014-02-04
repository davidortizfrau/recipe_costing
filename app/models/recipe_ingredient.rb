class RecipeIngredient < ActiveRecord::Base

	include ApplicationHelper

  attr_accessible :quantity,  :unit, 
                  :recipe_id, :ingredient_id

  # Validations
  validates :recipe_id, presence: true
  validates :ingredient_id, presence: true
  validates :quantity, presence: true
  validates :unit, presence: true

  # Relationships
  belongs_to :recipe
  belongs_to :ingredient

  
  default_scope order: :created_at

  
  # Get price
  def cost
  	if self.ingredient.unit == self.unit
  		cost_same_units
  	elsif weight_unit?(self.ingredient.unit) && weight_unit?(self.unit)
  		cost_weight_units
  	elsif volume_unit?(self.ingredient.unit) && volume_unit?(self.unit)
  		cost_volume_units
  	else
  		cost_unit_mixture
  	end
  end

  def cost_with_yield(quantity, price)
    
    # Assigning 100% to yield if none specied by model
    self.ingredient.yield ||= 100

    # Edible portion or product yield
    ep = (self.ingredient.yield / 100)
    
    #Get price
    quantity / ep * price
  end

  # Cost for same units
  def cost_same_units

    quantity = self.quantity

    price = self.ingredient.price

    #Get price with yield
    cost_with_yield(quantity, price)

  end


  # Cost for different weight unit
  # Uses methods from ApplicationHelper
  def cost_weight_units
  	#Convert component unit to ounces
  	quantity = convert_to_oz(self.quantity, self.unit)

  	#Convert price of ingredient to price/oz
  	price = price_per_oz(self.ingredient.unit, self.ingredient.price)

  	#Get price with yield
    cost_with_yield(quantity, price)
  end



  # Cost for different volume units
  # Uses methods from ApplicationHelper
  def price_volume_units
  	#Convert component unit to fl oz
  	quantity = convert_to_fl_oz(self.quantity, self.unit)

  	#Convert price of ingredient to price/fl_oz
  	price = price_per_fl_oz(self.ingredient.unit, self.ingredient.price)

  	#Get price with yield
    cost_with_yield(quantity, price)
  end

  # Cost for different volume units
  # Uses methods from ApplicationHelper
  def price_unit_mixture
  	# Get price per oz on ingredient
  	quantity = price_per_oz(self.ingredient.unit, self.ingredient.price)

  	#Convert volume unit to weight unit from Component
  	price = volume_to_weight(self.quantity, self.unit, self.ingredient.ounces_per_cup)

  	#Get price with yield
  	cost_with_yield(quantity, price)
  end

end
