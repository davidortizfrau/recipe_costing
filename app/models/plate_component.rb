class PlateComponent < ActiveRecord::Base

  include ApplicationHelper

  belongs_to :plate
  belongs_to :recipe
  attr_accessible :quantity, :unit, 
  								:plate_id, :recipe_id

  validates :plate_id, presence: true

  #Get cost
  def cost
  	if self.unit == self.recipe.yield_unit
  		cost_same_units
  	elsif weight_unit?(self.unit) && weight_unit?(self.recipe.yield_unit)
  		cost_weight_units
  	elsif volume_unit?(self.unit) && volume_unit?(self.recipe.yield_unit)
  		cost_volume_units
  	end
  end

  # Price for same units
  def cost_same_units
  	recipe   = self.recipe
    quantity = self.quantity
    price    = recipe.total_cost/recipe.yield

    # Get cost
    quantity * price
  end

  def cost_weight_units
  	recipe   = self.recipe

  	# Convert plate_component to ounces
  	quantity = convert_to_oz(self.quantity, self.unit)

  	# Convert recipe to ounces
  	recipe_ounces = convert_to_oz(recipe.yield, recipe.yield_unit)
  	
  	price = recipe.total_cost/recipe_ounces
  	cost = quantity * price
  end

  def cost_volume_units
  	recipe   = self.recipe

  	# Convert plate component to fl oz
  	quantity = convert_to_fl_oz(self.quantity, self.unit)

  	# Convert recipe to fl oz
  	recipe_fl_oz = convert_to_fl_oz(recipe.yield, recipe.yield_unit)	

  	#Price per fl oz
  	price = recipe.total_cost/recipe_fl_oz

  	# Cost
  	cost = quantity * price
  end
end
