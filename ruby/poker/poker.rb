require 'pry'

CARD_VALUES = {
  '2' => 1,
  '3' => 2,
  '4' => 3,
  '5' => 4,
  '6' => 5,
  '7' => 6,
  '8' => 7,
  '9' => 8,
  '10' => 9,
  'J' => 10,
  'Q' => 11,
  'K' => 12,
  'A' => 13
}.freeze

class Poker
  include Enumerable

  def initialize(hands)
    @hands = hands.map { |h| Hand.new(h) }
  end

  def each(&block)
    @hands.each(&block)
  end

  def best_hand
    max_score = max.score
    select { |hand| hand.score == max_score }
      .map(&:to_s)
  end
end

class Hand
  include Enumerable
  include Comparable

  attr_reader :cards

  def initialize(cards)
    @cards = cards.map { |c| Card.new(c) }
  end

  def each(&block)
    @cards.each(&block)
  end

  def <=>(other)
    score <=> other.score
  end

  def to_s
    map(&:to_s)
  end

  def score
    if straight
      100_000 * high_cards
    elsif three_of_a_kind
      10_000 * high_cards
    elsif two_pair
      1000 * high_cards
    elsif pair
      100 * high_cards
    else
      high_cards
    end
  end

  def high_cards
    cards.sort.map.with_index { |card, index| card.value ** (index + 1) }.sum
  end

  def pair
    uniq(&:value).count == count - 1
  end

  def two_pair
    uniq(&:value).count == count - 2
  end

  def three_of_a_kind
    any? do |card|
      count do |c|
        c.value == card.value
      end == 3
    end
  end

  def straight
    values = map(&:value).sort

    if values.include?(13)
      [[1, 2, 3, 4, 13], [9, 10, 11, 12, 13]].include?(values)
    else
      values.each_cons(2).all? { |a, b| b == a + 1 }
    end
  end
end

class Card
  include Comparable

  attr_reader :value, :to_s

  def initialize(card)
    @to_s = card
    @value = CARD_VALUES[card[0..-2]]
  end

  def <=>(other)
    value <=> other.value
  end
end
