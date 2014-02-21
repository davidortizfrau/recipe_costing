module CostingHelper
	
	def cost_same_units(quantity, price)
    quantity * price
  end

  # Cost for different weight units
  def cost_weight_units(quantity, unit, price, unit2)
  	q = convert_to_oz(quantity, unit)
  	p = price_per_oz(unit2, price)
    cost_same_units(q, p)
  end

  # Cost for different volume units
  def cost_volume_units(quantity, unit, price, unit2)
  	q = convert_to_fl_oz(quantity, unit)
  	p = price_per_fl_oz(unit2, price)
    cost_same_units(q, p)
  end

  # Cost for different kind of units
  def cost_unit_mixture(i)
  	quantity = price_per_oz(i.ingredient.unit, i.ingredient.price)
  	price = volume_to_weight(i.quantity, i.unit, i.ingredient.ounces_per_cup)
  	cost_same_units(quantity, price, i)
  end

end