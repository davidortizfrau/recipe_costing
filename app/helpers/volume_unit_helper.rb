module VolumeUnitHelper
	
	# Determine if unit is of Volume type
	def volume_unit?(unit)
		case unit
			when 'fl_oz'  then true
			when 'cup'    then true
			when 'pint'   then true
			when 'quart'  then true
			when 'gallon' then true
			when 'Tbsp'   then true
			when 'tsp'    then true
			else false
		end
	end

	# Converts any volume unit to fluid ounces
	def convert_to_fl_oz(amount, unit)
		case unit
			when 'gallon' then amount * 128
			when 'quart'  then amount * 32
			when 'pint'   then amount * 16
			when 'cup'    then amount * 8
			when 'fl_oz'  then amount
			when 'Tbsp'   then amount * 0.5
			when 'tsp'    then amount * 0.1666666666667
		end
	end

	def price_per_fl_oz(price, unit)
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