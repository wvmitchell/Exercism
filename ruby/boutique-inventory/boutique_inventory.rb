# frozen_string_literal: true

# Just an inventory system
class BoutiqueInventory
  def initialize(items)
    @items = items
  end

  def item_names
    items.map { |item| item[:name] }.sort
  end

  def cheap
    items.select { |item| item[:price] < 30 }
  end

  def out_of_stock
    items.select { |item| item_stock(item).zero? }
  end

  def stock_for_item(name)
    items.find { |i| i[:name] == name }.fetch(:quantity_by_size)
  end

  def total_stock
    items.sum { |item| item_stock(item) }
  end

  private

  attr_reader :items

  def item_stock(item)
    item[:quantity_by_size].sum { |_, count| count }
  end
end
