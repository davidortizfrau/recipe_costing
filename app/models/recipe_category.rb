class RecipeCategory < ActiveRecord::Base
  attr_accessible :name
  belongs_to :user
  has_many :recipes

  # Validations
  validates :name, presence: true
  validates :user_id, presence: true

  default_scope order(:name)
end
