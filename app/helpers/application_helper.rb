module ApplicationHelper
	def unit?(unit)
		case unit
		when 'oz'
			'weight'
		when '#'
			'weight'
		when 'fl_oz'
			'volume'
		when 'cup'
			'volume'
		when 'pint'
			'volume'
		when 'quart'
			'volume'
		when 'gallon'
			'volume'
		when 'Tbsp'
			'volume'
		when 'tsp'
			'volume'
		when 'ea'
			'other'
		when 'pack'
			'other'
		when 'head'
			'other'
		when 'can'
			'other'
		end
	end
end

