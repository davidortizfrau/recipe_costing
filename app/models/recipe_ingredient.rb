class RecipeIngredient < ActiveRecord::Base

	include ApplicationHelper
  include WeightUnitHelper
  include VolumeUnitHelper
  include CostingHelper
  include IngredientsHelper

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
end
