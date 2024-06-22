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
    items.select do |item|
      item[:quantity_by_size].sum { |_, v| v }.zero?
    end
  end

  def stock_for_item(name)
    items.find { |item| item[:name] == name }[:quantity_by_size]
  end

  def total_stock
    items.sum do |item|
      item[:quantity_by_size].sum { |_, quantity| quantity }
    end
  end

  private

  attr_reader :items
end
