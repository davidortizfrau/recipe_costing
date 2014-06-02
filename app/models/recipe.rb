class Recipe < ActiveRecord::Base
  attr_accessible :name, :yield, :yield_unit, :recipe_category_id

  # Validations
  validates :name, presence: true
  validates :user_id, presence: true
  validates :recipe_category_id, presence: true

  # Relationships
  belongs_to :user
  belongs_to :recipe_category		  				
  has_many :ingredients, class_name: "RecipeIngredient",:dependent => :destroy
  has_many :components,  class_name: "RecipeComponent", :dependent => :destroy

  default_scope order: :name

  # Class instance variables
  @categories = %w(sauces stocks salads proteins).sort
  @units = %w(portion ea oz # fl_oz cup pint quart gallon Tbsp tsp)

  class << self
  	attr_accessor :categories, :units
  end
  # End of class instance variables

  def total_cost
  	ingredients_cost + components_cost
  end

  def ingredients_cost
    t_cost = 0
    self.ingredients.each do |i|
      t_cost += i.cost
    end
    t_cost
  end

  def components_cost
    t_cost = 0
    self.components.each do |c|
      t_cost += c.cost(c.component)
    end
    t_cost
  end

  def cost_per_unit
    total_cost / self.yield if self.yield
  end
end