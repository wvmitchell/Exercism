// Package raindrops implements a simple library that converts a number into a string that contains raindrop sounds.
package raindrops

import "fmt"

// Convert takes in a number and converts it to a string based on the Pling/Plong/Plang algorithm
func Convert(number int) string {
	var result string
	if number%3 == 0 {
		result += "Pling"
	}

	if number%5 == 0 {
		result += "Plang"
	}

	if number%7 == 0 {
		result += "Plong"
	}

	if result != "" {
		return result
	}
	return fmt.Sprintf("%d", number)
}
