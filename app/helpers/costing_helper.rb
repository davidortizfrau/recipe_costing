module CostingHelper
	
	def cost_same_units(amount, price)
    amount * price
  end

  # Cost for different weight units
  def cost_weight_units(amount=0, amount_unit=0, price=0, price_unit=0)
  	q = convert_to_oz(amount, amount_unit)
  	p = price_per_oz(price, price_unit)
    cost_same_units(q, p)
  end

  # Cost for different volume units
  def cost_volume_units(amount=0, amount_unit=0, price=0, price_unit=0)
  	q = convert_to_fl_oz(amount, amount_unit)
  	p = price_per_fl_oz(price, price_unit)
    cost_same_units(q, p)
  end

  # Cost for different kind of units
  def cost_unit_mixture(amount=0, amount_unit=0, price=0, price_unit=0, ozcup)
    q = volume_to_weight(amount, amount_unit, ozcup)
  	p = price_per_oz(price, price_unit)
  	cost_same_units(q, p)
  end
end