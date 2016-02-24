MAX_QUALITY = 50
MIN_QUALITY = 0
def update_quality(items)
  items.each do |item|
    daily_inventory_update(item) unless legendary?(item)
  end
end

def daily_inventory_update(item)
  item.quality += daily_adjustment(item)
  increase_age(item)
  item.quality += expired_item_adjustment(item)
  item.quality = apply_quality_caps(item)
end

def legendary?(item)
  item.name == 'Sulfuras, Hand of Ragnaros'
end

def conjured?(item)
  item.name.include?("Conjured")
end

def better_with_age?(item)
  item.name == 'Aged Brie'
end

def time_sensitive?(item)
  item.name == 'Backstage passes to a TAFKAL80ETC concert'
end

def daily_adjustment(item)
  normal_item_degradation(item) + better_with_age_bonus(item) + time_sensitive_adjustment(item)
end

def normal_item_degradation(item)
  return -1 * conjured_item_multiplier(item) unless better_with_age?(item) || time_sensitive?(item)
  0
end

def better_with_age_bonus(item)
  return 1 if better_with_age?(item)
  0
end

def anticipation_bonus(item)
  return 1 if time_sensitive?(item)
  0
end

def time_sensitive_adjustment(item)
  if time_sensitive?(item)
    return 3 if final_5_days?(item)
    return 2 if final_10_days?(item)
    return 1
  end
  0
end

def final_10_days?(item)
  item.sell_in < 11
end

def final_5_days?(item)
  item.sell_in < 6
end

def increase_age(item)
  item.sell_in -= 1
end

def expired?(item)
  item.sell_in < 0
end

def apply_quality_caps(item)
  return MAX_QUALITY if item.quality > 50
  return MIN_QUALITY if item.quality < 0
  item.quality
end

def expired_item_adjustment(item)
  return thoroughly_aged_bonus(item) + expired_time_sensitive_adjustment(item) if expired?(item)
  0
end

def thoroughly_aged_bonus(item)
  return 1 if better_with_age?(item)
  -1 * conjured_item_multiplier(item)
end

def conjured_item_multiplier(item)
  return 2 if conjured?(item)
  1
end

def expired_time_sensitive_adjustment(item)
  return trash(item) if time_sensitive?(item)
  0
end

def trash(item)
  return -100
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
