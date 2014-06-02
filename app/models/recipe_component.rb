class RecipeComponent < ActiveRecord::Base
	include ApplicationHelper
  include WeightUnitHelper
  include VolumeUnitHelper
  include CostingHelper
  include ComponentsHelper

  attr_accessible :quantity, :unit, :recipe_id, :component_id 

  # Validations
  validates :component_id,  presence: true
  validates :recipe_id, presence: true
  validates :quantity,  presence: true
  validates :unit,      presence: true

  # Relationships
  belongs_to :component, class_name: "Recipe", foreign_key: 'component_id'
  belongs_to :recipe
  
  default_scope order: :created_at
end