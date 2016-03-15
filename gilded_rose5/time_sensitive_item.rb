require_relative 'item'
class TimeSensitiveItem < Item
  def exist_one_day
    super(daily_amount, expired_amount)
  end

  private

  def daily_amount
    1 + anticipation_bonus
  end

  def expired_amount
    -1000
  end

  def anticipation_bonus
    return 2 if last_five_days?
    return 1 if last_ten_days?
    0
  end

  def last_five_days?
    sell_in <= 5
  end

  def last_ten_days?
    sell_in <= 10
  end
end
