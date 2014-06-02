module ComponentsHelper
  def cost(recipe)
    comp = recipe

    same_units = self.unit == comp.yield_unit
    weight_units = weight_unit?(self.unit) && weight_unit?(comp.yield_unit) 
    volume_units = volume_unit?(self.unit) && volume_unit?(comp.yield_unit)

    if same_units
      cost_same_units(self.quantity, comp.cost_per_unit)
    elsif weight_units
      cost_weight_units(self.quantity, self.unit, comp.cost_per_unit, comp.yield_unit)
    elsif volume_units
      cost_volume_units(self.quantity, self.unit, comp.cost_per_unit, comp.yield_unit)
    else
      0
    end
  end
end