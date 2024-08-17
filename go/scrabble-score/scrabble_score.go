// Package scrabble implements a simple library that computes the Scrabble score for a word.
package scrabble

import "strings"

// Score computes the Scrabble score for a word.
func Score(word string) (score int) {
	values := map[string]int{
		"A": 1,
		"B": 3,
		"C": 3,
		"D": 2,
		"E": 1,
		"F": 4,
		"G": 2,
		"H": 4,
		"I": 1,
		"J": 8,
		"K": 5,
		"L": 1,
		"M": 3,
		"N": 1,
		"O": 1,
		"P": 3,
		"Q": 10,
		"R": 1,
		"S": 1,
		"T": 1,
		"U": 1,
		"V": 4,
		"W": 4,
		"X": 8,
		"Y": 4,
		"Z": 10,
	}

	for _, letter := range word {
		score += values[strings.ToUpper(string(letter))]
	}
	return score
}
