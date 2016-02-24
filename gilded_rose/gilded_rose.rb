def update_quality(items)
  items.each do |item|
    unless legendary_item?(item)
      item.quality += daily_adjustment(item)
      decrease_time_remaining(item)
      item.quality += expired_item_modifier(item)
      apply_quality_caps(item)
    end
  end
end

def daily_adjustment(item)
  change = 0
  change += degrading_item?(item) ? -1 : 1 + backstage_passes_modifier(item)
  change *= conjured_item_modifier(item)
  change
end

def decrease_time_remaining(item)
  item.sell_in -= 1
end

def expired_item_modifier(item)
  if expired?(item)
    return -50 if backstage_passes?(item)
    modifier = better_with_age?(item) ?  1 : -1
    return modifier * conjured_item_modifier(item)
  end
  0
end

def apply_quality_caps(item)
  item.quality = 50 if item.quality > 50
  item.quality = 0 if item.quality < 0
end

def degrading_item?(item)
  item.name != 'Aged Brie' && !backstage_passes?(item)
end

def better_with_age?(item)
  item.name == "Aged Brie"
end

def conjured_item?(item)
  item.name.include?("Conjured")
end

def legendary_item?(item)
  item.name == 'Sulfuras, Hand of Ragnaros'
end

def expired?(item)
  item.sell_in < 0
end

def backstage_passes?(item)
  item.name == 'Backstage passes to a TAFKAL80ETC concert'
end

def conjured_item_modifier(item)
  return 2 if conjured_item?(item)
  1
end

def backstage_passes_modifier(item)
  if backstage_passes?(item)
    return 2 if item.sell_in < 6
    return 1 if item.sell_in < 11
  end
  0
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
