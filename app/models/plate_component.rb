class PlateComponent < ActiveRecord::Base
  include ApplicationHelper
  include WeightUnitHelper
  include VolumeUnitHelper
  include CostingHelper
  include ComponentsHelper

  attr_accessible :quantity, :unit, :plate_id, :recipe_id

  # Validations
  validates :plate_id,  presence: true
  validates :recipe_id, presence: true
  validates :quantity,  presence: true
  validates :unit,      presence: true

  # Relationships
  belongs_to :plate
  belongs_to :recipe
  
  default_scope order: :created_at
end
