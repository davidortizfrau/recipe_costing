class PlateIngredient < ActiveRecord::Base
  
  include ApplicationHelper
  include WeightUnitHelper
  include VolumeUnitHelper
  include CostingHelper
  include IngredientsHelper

  attr_accessible :quantity, :unit, 
                  :plate_id, :ingredient_id

  # Validations
  validates :plate_id, presence: true
  validates :ingredient_id, presence: true
  # validates :quantity, presence: true
  # validates :unit, presence: true

  # Relationships
  belongs_to :plate
  belongs_to :ingredient
  
  default_scope order: :created_at
end
