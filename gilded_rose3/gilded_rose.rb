MAX_QUALITY = 50
MIN_QUALITY = 0
def update_quality(items)
  items.each do |item|
    unless legendary_item?(item)
      daily_quality_adjustment(item)
      decrease_days_left(item)
      update_expired(item)
      apply_quality_cap(item)
    end
  end
end

def daily_quality_adjustment(item)
  if better_with_age?(item) || time_sensitive?(item)
    improve_item(item)
  else
    degrade_item(item)
  end
end

def update_expired(item)
  apply_expired_adjustment(item) if expired?(item)
end

def apply_expired_adjustment(item)
  if better_with_age?(item)
    increase_quality(item)
  else
    degrade_item(item)
  end
  trash(item) if time_sensitive?(item)
end

def increase_quality(item, amount=1)
  item.quality += amount
end

def decrease_quality(item, amount=1)
  item.quality -= amount
end

def apply_quality_cap(item)
  item.quality = MAX_QUALITY if above_max_quality?(item)
  item.quality = MIN_QUALITY if below_min_quality?(item)
end

def improve_item(item)
  amount = 1
  amount += anticipation_bonus(item) if time_sensitive?(item)
  increase_quality(item, amount)
end

def degrade_item(item)
  amount = conjured_item?(item) ? 2 : 1
  decrease_quality(item, amount)
end

def above_max_quality?(item)
  item.quality > MAX_QUALITY
end

def below_min_quality?(item)
  item.quality < MIN_QUALITY
end

def decrease_days_left(item)
  item.sell_in -= 1
end

def legendary_item?(item)
  item.name == 'Sulfuras, Hand of Ragnaros'
end

def conjured_item?(item)
  item.name.include?("Conjured")
end

def expired?(item)
  item.sell_in < 0
end

def better_with_age?(item)
  item.name == 'Aged Brie'
end

def time_sensitive?(item)
  item.name == 'Backstage passes to a TAFKAL80ETC concert'
end

def anticipation_bonus(item)
  amount = 0
  amount += 1 if item.sell_in < 11
  amount += 1 if item.sell_in < 6
  amount
end

def trash(item)
  item.quality = 0
end
# DO NOT CHANGE THINGS BELOW -----------------------------------------

Item = Struct.new(:name, :sell_in, :quality)

# We use the setup in the spec rather than the following for testing.
#
# Items = [
#   Item.new("+5 Dexterity Vest", 10, 20),
#   Item.new("Aged Brie", 2, 0),
#   Item.new("Elixir of the Mongoose", 5, 7),
#   Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
#   Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
#   Item.new("Conjured Mana Cake", 3, 6),
# ]
