module WeightUnitHelper
	def weight_unit?(unit)
		case unit
		when 'oz'
			true
		when '#'
			true
		when 'fl_oz'
			false
		when 'cup'
			false
		when 'pint'
			false
		when 'quart'
			false
		when 'gallon'
			false
		when 'Tbsp'
			false
		when 'tsp'
			false
		end
	end

	def convert_to_oz(amount, unit)
		case unit
		when '#'
			amount * 16
		when 'oz'
			amount			
		end
	end

	def price_per_oz(unit, price)
		ounces = convert_to_oz(1, unit)
		price / ounces
	end
end