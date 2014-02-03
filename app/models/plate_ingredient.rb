class PlateIngredient < ActiveRecord::Base
  
  include ApplicationHelper

  belongs_to :plate
  belongs_to :ingredient
  
  attr_accessible :quantity, :unit, :plate_id, :ingredient_id

  validates :plate_id, presence: true
  validates :ingredient_id, presence: true

  # Get price
  def price
  	if self.ingredient.unit == self.unit
  		price_same_units
  	elsif weight_unit?(self.ingredient.unit) && weight_unit?(self.unit)
  		price_weight_units
  	elsif volume_unit?(self.ingredient.unit) && volume_unit?(self.unit)
  		price_volume_units
  	else
  		price_unit_mixture
  	end
  end

  def price_with_yield(quantity, price)
    
    # Edible portion or product yield
    ep = (self.ingredient.yield / 100)
    
    #Get price
    quantity / ep * price
  end

  # Price for same units
  def price_same_units

    quantity = self.quantity

    price = self.ingredient.price

    #Get price with yield
    price_with_yield(quantity, price)

  end


  # Price for different weight unit
  # Uses methods from ApplicationHelper
  def price_weight_units
  	#Convert component unit to ounces
  	quantity = convert_to_oz(self.quantity, self.unit)

  	#Convert price of ingredient to price/oz
  	price = price_per_oz(self.ingredient.unit, self.ingredient.price)

  	#Get price with yield
    price_with_yield(quantity, price)
  end



  # Price for different volume units
  #Uses methods from ApplicationHelper
  def price_volume_units
  	#Convert component unit to fl oz
  	quantity = convert_to_fl_oz(self.quantity, self.unit)

  	#Convert price of ingredient to price/fl_oz
  	price = price_per_fl_oz(self.ingredient.unit, self.ingredient.price)

  	#Get price with yield
    price_with_yield(quantity, price)
  end

  # Price for different volume units
  #Uses methods from ApplicationHelper
  def price_unit_mixture
  	# Get price per oz on ingredient
  	quantity = price_per_oz(self.ingredient.unit, self.ingredient.price)

  	#Convert volume unit to weight unit from Component
  	price = volume_to_weight(self.quantity, self.unit, self.ingredient.ounces_per_cup)

  	#Get price with yield
  	price_with_yield(quantity, price)
  end
end
