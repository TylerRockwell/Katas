class Numerals
  def numeralize(input)
    input
    numerals = ""

    roman_numerals = {1000 => "M", 900 => "CM", 500 => "D", 100 => "C",
      50 => "L", 10 => "X", 9 => "IX", 5=> "V", 4 => "IV", 1 => "I"}

    roman_numerals.each do |number, numeral|
      if input >= number
        numerals << (numeral * (input/number))
        input %= number
      end
    end
    
    numerals
  end
end
