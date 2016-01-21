require_relative 'money_machine'

describe MoneyMachine do
	let(:money_machine) { MoneyMachine.new }

	it "should take one parameter and return an array" do
		expect(money_machine.make_change(0)).to eq([])
	end

	it "should return the correct number of quarters" do
		expect(money_machine.make_change(100)).to eq([25, 25, 25, 25])
	end

	it "should return the correct number of dimes" do
		expect(money_machine.make_change(20)).to eq([10, 10])
	end

	it "should return the correct number of nickels" do
		expect(money_machine.make_change(5)).to eq([5])
	end

	it "should return the correct number of pennies" do
		expect(money_machine.make_change(3)).to eq([1, 1, 1])
	end

	it "should return the correct change for all these values" do
		expect(money_machine.make_change(145)).to eq([25, 25, 25, 25, 25, 10, 10])
		expect(money_machine.make_change(100)).to eq([25, 25, 25, 25])
		expect(money_machine.make_change(75)).to eq([25, 25, 25])
		expect(money_machine.make_change(80)).to eq([25, 25, 25, 5])
		expect(money_machine.make_change(70)).to eq([25, 25, 10, 10])
		expect(money_machine.make_change(62)).to eq([25, 25, 10, 1, 1])
		expect(money_machine.make_change(4)).to eq([1, 1, 1, 1])
		expect(money_machine.make_change(0)).to eq([])
	end
end
