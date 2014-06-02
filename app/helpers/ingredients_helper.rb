module IngredientsHelper
	 def cost
    ing = self.ingredient

    same_units = self.ingredient.unit == self.unit && ing.price != nil && self.quantity != nil
    weight_units = weight_unit?(ing.unit) && weight_unit?(self.unit) 
    volume_units = volume_unit?(ing.unit) && volume_unit?(self.unit)
    
    if same_units
      cost_same_units(q_yield, ing.price)
    elsif weight_units
      cost_weight_units(q_yield, self.unit, ing.price, ing.unit)  
    elsif volume_units
      cost_volume_units(self.quantity, self.unit, ing.price, ing.unit) 
    elsif ing.ounces_per_cup
      cost_unit_mixture(self.q_yield, self.unit, ing.price, ing.unit, ing.ounces_per_cup)
    else
      0
    end
  end

  def q_yield
    self.ingredient.yield ||= 100
    self.quantity / (self.ingredient.yield / 100) if self.quantity?
    0 if !self.quantity?
  end
end