class Numerals
	def numeralize(number)
		numerals = ""
		converter = { 1000 => "M", 900 => "CM", 500 => "D", 400 => "CD", 100 => "C",
									50 => "L", 10 => "X", 9 => "IX", 5 => "V", 4 => "IV", 1 => "I"
								}

		converter.each do |divisor, numeral|
			(number / divisor).times { numerals << numeral }
			number %= divisor
		end
		numerals
	end
end
