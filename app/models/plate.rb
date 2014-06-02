class Plate < ActiveRecord::Base
  attr_accessible :name, :sales_price, :plate_category_id, :user_id

  # Validations
  validates :name, presence: true
  validates :user_id, presence: true
  validates :plate_category_id, presence: true

  # Relationships
  belongs_to :user
  belongs_to :plate_category
  has_many :components, class_name: "PlateComponent", :dependent => :destroy
  has_many :ingredients, class_name: "PlateIngredient", :dependent => :destroy

  # Class instance variables
  @categories = %w(appetizer entree dessert)
  @units = %w(portion ea oz # fl_oz cup pint quart Tbsp tsp)

  class << self
  	attr_accessor :categories, :units
  end
  # End of class instance variables

  def total_cost
    ingredients_cost + components_cost
  end

  def food_cost
    cost = self.total_cost
    if self.sales_price
      cost / self.sales_price * 100
    else
      "0"
    end
  end
private
  def ingredients_cost
    cost = 0
    self.ingredients.each do |i|
      cost += i.cost
    end
    cost
  end

  def components_cost
    cost = 0
    self.components.each do |c|
      cost += c.cost(c.recipe)
    end
    cost
  end
end