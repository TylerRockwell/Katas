require_relative 'coin_changer'

describe CoinChanger do
  before(:each) do
    @changer = CoinChanger.new
  end

  it "should make change with 1 parameter" do
    expect(@changer.make_change(100))
  end

  it "should return the correct number of quarters" do
    expect(@changer.make_change(100)).to eq [25,25,25,25]
  end

  it "should return the correct number of dimes" do
    expect(@changer.make_change(20)).to eq [10,10]
  end

  it "should return the correct number of nickels" do
    expect(@changer.make_change(5)).to eq [5]
  end

  it "should return the correct number of pennies" do
    expect(@changer.make_change(4)).to eq [1,1,1,1]
  end

  it "should return an empty array when param is 0" do
    expect(@changer.make_change(0)).to eq []
  end

  it "should make correct change for any amount" do
    expect(@changer.make_change(145)).to eq [25,25,25,25,25,10,10]
    expect(@changer.make_change(100)).to eq [25,25,25,25]
    expect(@changer.make_change(75)).to eq  [25,25,25]
    expect(@changer.make_change(80)).to eq  [25,25,25,5]
    expect(@changer.make_change(70)).to eq  [25,25,10,10]
    expect(@changer.make_change(62)).to eq  [25,25,10,1,1]
    expect(@changer.make_change(4)).to eq   [1,1,1,1]
    expect(@changer.make_change(0)).to eq   []
  end
end
