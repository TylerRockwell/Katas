require_relative 'numerals.rb'

RSpec.describe Numerals do
	describe "#numeralize" do
		let(:n) { Numerals.new }
		it "converts 1000 to M" do
			expect(n.numeralize(1000)).to eq("M")
		end

		it "converts 900 to CM" do
			expect(n.numeralize(900)).to eq("CM")
		end

		it "converts 500 to D" do
			expect(n.numeralize(500)).to eq("D")
		end

		it "converts 100 to C" do
			expect(n.numeralize(100)).to eq("C")
		end

		it "converts 50 to L" do
			expect(n.numeralize(50)).to eq("L")
		end

		it "converts 10 to X" do
			expect(n.numeralize(10)).to eq("X")
		end
		
		it "converts 9 to IX" do
			expect(n.numeralize(9)).to eq("IX")
		end

		it "converts 5 to V" do
			expect(n.numeralize(5)).to eq("V")
		end

		it "converts 4 to IV" do
			expect(n.numeralize(4)).to eq("IV")
		end

		it "converts 1 to I" do
			expect(n.numeralize(1)).to eq("I")
		end

		it "converts all these numbers" do
			expect(n.numeralize(1000)).to eq("M")
			expect(n.numeralize(900)).to eq("CM")
			expect(n.numeralize(500)).to eq("D")
			expect(n.numeralize(450)).to eq("CDL")
			expect(n.numeralize(225)).to eq("CCXXV")
			expect(n.numeralize(75)).to eq("LXXV")
			expect(n.numeralize(37)).to eq("XXXVII")
			expect(n.numeralize(18)).to eq("XVIII")
			expect(n.numeralize(9)).to eq("IX")
			expect(n.numeralize(4)).to eq("IV")
			expect(n.numeralize(2)).to eq("II")
			expect(n.numeralize(1)).to eq("I")
		end
	end
end
