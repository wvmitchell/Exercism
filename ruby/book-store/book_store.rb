module BookStore
  BASE_PRICE = 8.00
  SET_QUANTITY_DISCOUNTS = {
    1 => 1.00,
    2 => 0.95,
    3 => 0.90,
    4 => 0.80,
    5 => 0.75
  }.freeze
  BOOKS = [1, 2, 3, 4, 5].freeze

  def self.calculate_price(basket)
    sets = convert_basket_to_sets(basket)
    sets = create_four_element_sets_from_threes_and_fives(sets)
    calculate_price_of_sets(sets)
  end

  def self.convert_basket_to_sets(basket)
    if basket.length <= 1
      [basket]
    else
      set = discount_sets(basket).max_by(&:length)
      new_basket = subtract(basket, set)
      [set, *convert_basket_to_sets(new_basket)]
    end
  end

  def self.discount_sets(basket)
    (0..BOOKS.length).flat_map do |set_size|
      BOOKS.combination(set_size).select { |set| (basket & set).size == set.size }
    end
  end

  def self.calculate_price_of_sets(sets)
    sets.reduce(0) do |total, set|
      total += set.length * BASE_PRICE * (SET_QUANTITY_DISCOUNTS[set.length] || 0)
      total
    end
  end

  def self.create_four_element_sets_from_threes_and_fives(sets)
    sets.length.times do
      five_element_index = sets.index { |set| set.length == 5 }
      three_element_index = sets.index { |set| set.length == 3 }
      next unless five_element_index && three_element_index

      f_set = sets[five_element_index]
      t_set = sets[three_element_index]
      difference = f_set - t_set
      t_set << f_set.pop if difference.length
    end
    sets
  end

  def self.subtract(basket, set)
    basket.dup.tap do |duplicate_basket|
      set.each do |book|
        duplicate_basket.delete_at(duplicate_basket.index(book))
      end
    end
  end
end
