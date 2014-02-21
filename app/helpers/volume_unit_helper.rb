module VolumeUnitHelper
	
	# Determine if unit is of Volume type
	def volume_unit?(unit)
		case unit
		when 'oz'
			false
		when '#'
			false
		when 'fl_oz'
			true
		when 'cup'
			true
		when 'pint'
			true
		when 'quart'
			true
		when 'gallon'
			true
		when 'Tbsp'
			true
		when 'tsp'
			true
		end
	end

	# Converts any volume unit to fluid ounces
	def convert_to_fl_oz(amount, unit)
		case unit
		when 'gallon'
			amount * 128
		when 'quart'
			amount * 32
		when 'pint'
			amount * 16
		when 'cup'
			amount * 8
		when 'fl_oz'
			amount
		when 'Tbsp'
			amount * 0.5
		when 'tsp'
			amount * 0.1666666666667
		end
	end

	def price_per_fl_oz(unit, price)
		fl_ozs = convert_to_fl_oz(1, unit)
		price / fl_ozs
	end

	def volume_to_weight(amount, volume_unit, ounces_per_cup = 0)
		# Convert unit to cups
		ounces_per_cup = 8 if ounces_per_cup == nil

		cups = convert_to_fl_oz(amount, volume_unit) / 8
		cups * ounces_per_cup
	end
	
end