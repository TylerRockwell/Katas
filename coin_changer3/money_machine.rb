class MoneyMachine
	def make_change(dollars)
		change = []
		[25, 10, 5, 1].each do |coin|
			(dollars/coin).times { change << coin }	
			dollars %= coin
		end	
		change
	end
end
