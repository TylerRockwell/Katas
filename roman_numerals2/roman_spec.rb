require_relative 'roman.rb'

describe Roman do
	before(:each) do
		@roman = Roman.new
	end
	describe "#numeralize" do
		it "should take one parameter and return an empty string" do
			expect(@roman.numeralize(0)).to eq("")
		end
		
		it "should return 'M' for 1000" do
			expect(@roman.numeralize(1000)).to eq("M")
		end

		it "should return 'CM' for 900" do
			expect(@roman.numeralize(900)).to eq("CM")
		end
		
		it "should return 'D' for 500" do
			expect(@roman.numeralize(500)).to eq("D")
		end	

		it "should return 'CD' for 400" do
			expect(@roman.numeralize(400)).to eq("CD")
		end

		it "should return 'C' for 100" do
			expect(@roman.numeralize(100)).to eq("C")
		end

		it "should return 'L' for 50" do
			expect(@roman.numeralize(50)).to eq("L")
		end

		it "should return 'X' for 10" do
			expect(@roman.numeralize(10)).to eq("X")
		end

		it "should return 'IX' for 9" do
			expect(@roman.numeralize(9)).to eq("IX")
		end

		it "should return 'V' for 5" do
			expect(@roman.numeralize(5)).to eq("V")
		end
	
		it "should return 'IV' for 4" do
			expect(@roman.numeralize(4)).to eq("IV")
		end

		it "should return 'I' for 1" do
			expect(@roman.numeralize(1)).to eq("I")
		end

		it "should correctly format the following numbers" do
			expect(@roman.numeralize(1000)).to eq("M")
			expect(@roman.numeralize(900)).to eq("CM")	
			expect(@roman.numeralize(700)).to eq("DCC")	
			expect(@roman.numeralize(500)).to eq("D")	
			expect(@roman.numeralize(450)).to eq("CDL")	
			expect(@roman.numeralize(225)).to eq("CCXXV")	
			expect(@roman.numeralize(75)).to eq("LXXV")	
			expect(@roman.numeralize(37)).to eq("XXXVII")	
			expect(@roman.numeralize(18)).to eq("XVIII")	
			expect(@roman.numeralize(9)).to eq("IX")	
			expect(@roman.numeralize(4)).to eq("IV")	
			expect(@roman.numeralize(2)).to eq("II")	
			expect(@roman.numeralize(1)).to eq("I")
		end	
	end
end
