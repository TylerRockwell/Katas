require_relative 'change_machine'

describe ChangeMachine do
	let(:machine){ ChangeMachine.new }

	it "should return the correct number of quarters" do
		expect(machine.make_change(100)).to eq([25, 25, 25, 25])
	end

	it "should return the correct number of dimes" do
		expect(machine.make_change(20)).to eq([10, 10])
	end

	it "should return the correct number of nickels" do
		expect(machine.make_change(5)).to eq([5])
	end

	it "should return the correct number of pennies" do
		expect(machine.make_change(3)).to eq([1, 1, 1])
	end

	it "should return the correct change for all these amounts" do
		expect(machine.make_change(145)).to eq([25, 25, 25, 25, 25, 10, 10])
		expect(machine.make_change(100)).to eq([25, 25, 25, 25])
		expect(machine.make_change(75)).to eq([25, 25, 25])
		expect(machine.make_change(80)).to eq([25, 25, 25, 5])
		expect(machine.make_change(70)).to eq([25, 25, 10, 10])
		expect(machine.make_change(62)).to eq([25, 25, 10, 1, 1])
		expect(machine.make_change(4)).to eq([1, 1, 1, 1])
		expect(machine.make_change(0)).to eq([])
	end
end
