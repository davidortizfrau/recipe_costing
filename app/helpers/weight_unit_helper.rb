module WeightUnitHelper
	def weight_unit?(unit)
		case unit
		  when 'oz' then true
		  when '#' then true
		  else false
		end
	end

	def convert_to_oz(amount, unit)
		case unit
			when '#'  then amount * 16
			when 'oz' then amount			
		end
	end

	def price_per_oz(price, unit)
		ounces = convert_to_oz(1, unit)
		price / ounces
	end
end