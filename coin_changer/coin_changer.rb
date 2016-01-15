class CoinChanger
  def make_change(dollars)
    change = []
    money_remaining = dollars

    [25, 10, 5, 1].each do |coin|
      #quarters
      (money_remaining/coin).times do
        change << coin
      end
      money_remaining %= coin
    end
    change
  end
end
