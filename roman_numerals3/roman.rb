class Roman
	def initialize
		@key = { 1000 => "M", 900 => "CM", 500 => "D", 400 => "CD", 100 => "C", 50 => "L", 10 => "X",
			9 => "IX", 5 => "V", 4 => "IV", 1 => "I"	}	
	end

	def numeralize(number)
		numerals = ""
		
		@key.each do |value, numeral|
			numerals << ( numeral * (number/value)) 
			number %= value
		end

		numerals
	end
end
