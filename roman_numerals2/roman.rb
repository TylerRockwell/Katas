class Roman
	def numeralize(digits)
		conversions = {1000 => "M", 900 => "CM", 500 => "D", 400 => "CD", 100 => "C", 50 => "L",
				10 => "X", 9 => "IX", 5 => "V", 4 => "IV", 1 => "I"}	
		roman_numerals = ""	
		conversions.each do |value, numeral|
			(digits/value).times do
				roman_numerals << numeral 
			end
			digits %= value 
		end
		roman_numerals
	end
end
