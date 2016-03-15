require_relative 'item'
class ConjuredItem < Item
  DAILY_QUALITY_CHANGE = -2
  EXPIRED_QUALITY_CHANGE = -2
  def exist_one_day
    super(DAILY_QUALITY_CHANGE, EXPIRED_QUALITY_CHANGE)
  end
end
