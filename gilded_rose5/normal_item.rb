require_relative 'item'
class NormalItem < Item
  DAILY_QUALITY_CHANGE = -1
  EXPIRED_QUALITY_CHANGE = -1
  def exist_one_day
    super(DAILY_QUALITY_CHANGE, EXPIRED_QUALITY_CHANGE)
  end
end
