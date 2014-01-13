module ApplicationHelper
	
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


	# Use the next methods on ingredients only
	#
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

	# Use the next methods on plate components (recipes) only
	#
	def get_component_cost(plate_component)
		
		# Make component and recipe units the same

		# Divide Price of Recipe by Total Yield to get
		# price per single unit

		# Multiply amount of component by price of single unit

	end




end

