require_relative 'item'
require_relative 'legendary_item'
require_relative 'normal_item'
require_relative 'time_sensitive_item'
require_relative 'aged_item'
require_relative 'conjured_item'

def update_quality(items)
  items.each do |item|
    item.exist_one_day
  end
end
