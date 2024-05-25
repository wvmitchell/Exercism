module Blackjack
  CARD_VALUES = {
    ace: 11,
    two: 2,
    three: 3,
    four: 4,
    five: 5,
    six: 6,
    seven: 7,
    eight: 8,
    nine: 9,
    ten: 10,
    jack: 10,
    queen: 10,
    king: 10
  }
  CARD_VALUES.default = 0

  def self.parse_card(card)
    CARD_VALUES[card.to_sym]
  end

  def self.card_range(card1, card2)
    total = [card1, card2].sum { |card| parse_card(card) }

    case total
    when 4..11 then 'low'
    when 12..16 then 'mid'
    when 17..20 then 'high'
    when 21 then 'blackjack'
    when 22 then 'aces'
    end
  end

  def self.first_turn(card1, card2, dealer_card)
    range = card_range(card1, card2)
    dealer = parse_card(dealer_card)

    case
    when range == 'aces'
      'P'
    when range == 'blackjack' && dealer < 10
      'W'
    when range == 'blackjack' && dealer >= 10
      'S'
    when range == 'high'
      'S'
    when range == 'mid' && dealer < 7
      'S'
    else
      'H'
    end
  end
end
