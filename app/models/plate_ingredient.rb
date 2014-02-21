class PlateIngredient < ActiveRecord::Base
  
  include ApplicationHelper
  include WeightUnitHelper
  include VolumeUnitHelper
  include CostingHelper

  attr_accessible :quantity, :unit, 
                  :plate_id, :ingredient_id

  # Validations
  validates :plate_id, presence: true
  validates :ingredient_id, presence: true
  validates :quantity, presence: true
  validates :unit, presence: true

  # Relationships
  belongs_to :plate
  belongs_to :ingredient
  
  default_scope order: :created_at

  # Get cost
  def cost

    ing = self.ingredient

  	if self.ingredient.unit == self.unit
  		0#cost_same_units
  	elsif weight_unit?(self.ingredient.unit) && weight_unit?(self.unit)
  		0#cost_weight_units
  	elsif volume_unit?(self.ingredient.unit) && volume_unit?(self.unit)
  		0#cost_volume_units
  	else
  		0# cost_unit_mixture
  	end
  end

private
  def q_yield
    self.ingredient.yield ||= 100

    self.quantity / (self.ingredient.yield / 100)
  end

end
