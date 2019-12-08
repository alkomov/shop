class Order < ApplicationRecord
  def items_formatted
    splitted_ids = item_ids.split(',')
    splitted_ids.uniq.map do |item_id|
      { item: Item.find(item_id), count: splitted_ids.count(item_id) }
    end
  end
end