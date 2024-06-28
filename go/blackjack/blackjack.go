// Package blackjack implements a simple game of blackjack.
package blackjack

var cardValues = map[string]int{
	"ace":   11,
	"two":   2,
	"three": 3,
	"four":  4,
	"five":  5,
	"six":   6,
	"seven": 7,
	"eight": 8,
	"nine":  9,
	"ten":   10,
	"jack":  10,
	"queen": 10,
	"king":  10,
}

// ParseCard returns the integer value of a card following blackjack ruleset.
func ParseCard(card string) int {
	return cardValues[card]
}

// FirstTurn returns the decision for the first turn, given two cards of the
// player and one card of the dealer.
func FirstTurn(card1, card2, dealerCard string) string {
	playerScore := ParseCard(card1) + ParseCard(card2)
	dealerScore := ParseCard(dealerCard)

	switch {
	case playerScore == 22:
		return "P"
	case playerScore == 21 && dealerScore < 10:
		return "W"
	case playerScore == 21 && dealerScore >= 21:
		return "S"
	case playerScore >= 17:
		return "S"
	case playerScore < 17 && playerScore > 11 && dealerScore < 7:
		return "S"
	case playerScore < 17 && playerScore > 11 && dealerScore > 7:
		return "H"
	default:
		return "H"
	}
}
