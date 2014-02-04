class Plate < ActiveRecord::Base
  attr_accessible :name, :sales_price, :category, :user_id

  # Validations
  validates :name, presence: true
  validates :user_id, presence: true


  # Relationships
  belongs_to :user
  has_many :plate_components
  has_many :plate_ingredients

  # Class instance variables

  @categories = %w(appetizer entree dessert meal)
  @units = %w(portion ea oz # fl_oz cup pint quart Tbsp tsp)

  class << self
  	attr_accessor :categories, :units
  end

  # End of class instance variables

  def total_cost
    cost = 0
    self.plate_components.each do |c|
      cost += c.cost
    end
    self.plate_ingredients.each do |c|
      cost += c.price
    end

    cost
  end

  def food_cost
  	cost = self.total_cost
    if self.sales_price
      cost / self.sales_price * 100
    else
      "0"
    end
  end
  
end
