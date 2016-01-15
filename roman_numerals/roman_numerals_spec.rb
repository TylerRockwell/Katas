require_relative 'roman_numerals'

describe Numerals do
  before(:each) do
    @numerals = Numerals.new
  end

  it "should handle thousands" do
    expect(@numerals.numeralize(1000)).to eq("M")
    expect(@numerals.numeralize(4000)).to eq("MMMM")
  end

  it "should handle nine hundred" do
    expect(@numerals.numeralize(900)).to eq("CM")
  end

  it "should handle five hundred" do
    expect(@numerals.numeralize(500)).to eq("D")
  end

  it "should handle one hundred" do
    expect(@numerals.numeralize(100)).to eq("C")
  end

  it "should handle fifty" do
    expect(@numerals.numeralize(50)).to eq("L")
  end

  it "should handle ten" do
    expect(@numerals.numeralize(10)).to eq("X")
  end

  it "should handle nine" do
    expect(@numerals.numeralize(9)).to eq("IX")
  end

  it "should handle five" do
    expect(@numerals.numeralize(5)).to eq("V")
  end

  it "should handle four" do
    expect(@numerals.numeralize(4)).to eq("IV")
  end

  it "should handle one" do
    expect(@numerals.numeralize(1)).to eq("I")
  end
end
