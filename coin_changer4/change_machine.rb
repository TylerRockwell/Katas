class ChangeMachine
	def make_change(money)
		change = []
		[25, 10, 5, 1].each do |coin|
			(money/coin).times do
				change << coin
			end
			money %= coin
		end
		change
	end	
end
