require_relative 'coin_changer'

describe CoinChanger do
  before(:each) do
    @c = CoinChanger.new
  end

  it "returns the correct number of quarters" do
    expect(@c.make_change(100)).to eq([25,25,25,25])
  end

  it "returns the correct number of dimes" do
    expect(@c.make_change(20)).to eq([10,10])
  end

  it "returns the correct number of nickels" do
    expect(@c.make_change(30)).to eq([25,5])
  end

  it "returns the correct number of pennies" do
    expect(@c.make_change(4)).to eq([1,1,1,1])
  end

  it "passes all these tests" do
    expect(@c.make_change(145)).to eq([25,25,25,25,25,10,10])
    expect(@c.make_change(100)).to eq([25,25,25,25])
    expect(@c.make_change(75)).to eq([25,25,25])
    expect(@c.make_change(80)).to eq([25,25,25,5])
    expect(@c.make_change(70)).to eq([25,25,10,10])
    expect(@c.make_change(62)).to eq([25,25,10,1,1])
    expect(@c.make_change(4)).to eq([1,1,1,1])
    expect(@c.make_change(0)).to eq([])
  end
end
