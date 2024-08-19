// Package isogram provides a function to check if a word is an isogram
package isogram

import "strings"

// IsIsogram checks if a word is an isogram
func IsIsogram(word string) bool {
	set := map[rune]bool{}
	for _, c := range strings.ToLower(word) {
		if set[c] {
			return false
		} else if c != '-' && c != ' ' {
			set[c] = true
		}
	}
	return true
}
