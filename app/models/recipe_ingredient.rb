class RecipeIngredient < ActiveRecord::Base

	include ApplicationHelper
  include WeightUnitHelper
  include VolumeUnitHelper
  include CostingHelper

  attr_accessible :quantity,  :unit, 
                  :recipe_id, :ingredient_id

  # Validations
  validates :recipe_id,     presence: true
  validates :ingredient_id, presence: true
  validates :quantity,      presence: true
  validates :unit,          presence: true

  # Relationships
  belongs_to :recipe
  belongs_to :ingredient
  
  default_scope order: :created_at
  
  # Get price
  def cost

    ing = self.ingredient

  	if self.ingredient.unit == self.unit
  		cost_same_units(q_yield, ing.price)
  	elsif weight_unit?(ing.unit) && weight_unit?(self.unit)
  		cost_weight_units(q_yield, self.unit, ing.price, ing.unit)
  	elsif volume_unit?(ing.unit) && volume_unit?(self.unit)
  		cost_volume_units(self.quantity, self.unit, ing.price, ing.unit)
  	elsif ing.ounces_per_cup
  		0# cost_unit_mixture(self)
  	end
  end

private
  def q_yield
    self.ingredient.yield ||= 100

    self.quantity / (self.ingredient.yield / 100)
  end

end
