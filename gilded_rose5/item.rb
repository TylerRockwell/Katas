class Item
  attr_accessor :name, :sell_in, :quality
  def exist_one_day(daily_amount, expired_amount)
    adjust_quality(daily_amount)
    age_one_day
    adjust_quality(expired_amount) if expired?
    apply_quality_caps
    self
  end

  private
  
  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def adjust_quality(amount=1)
    self.quality += amount
  end

  def age_one_day
    self.sell_in -= 1
  end

  def expired?
    self.sell_in < 0
  end

  def apply_quality_caps
    self.quality = 50 if quality > 50
    self.quality = 0 if quality < 0
  end
end
