require 'pry'

CARD_VALUES = {
  '2' => 0,
  '3' => 1,
  '4' => 2,
  '5' => 3,
  '6' => 4,
  '7' => 5,
  '8' => 6,
  '9' => 7,
  '10' => 8,
  'J' => 9,
  'Q' => 10,
  'K' => 11,
  'A' => 12
}.freeze

class Poker
  attr_reader :hands

  def initialize(hands)
    @hands = hands
  end

  def best_hand
    [hands.max_by { |hand| high_card(hand) }]
  end

  def high_card(hand)
    hand.max_by { |card| CARD_VALUES[card[0..-2]] }
  end
end
