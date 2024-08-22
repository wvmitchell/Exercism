// Package luhn validates string against the Luhn algorithm.
package luhn

import (
	"regexp"
	"strconv"
)

// Valid takes a string a return true/false if the string is valid/invalid
func Valid(id string) bool {
	numRegx := regexp.MustCompile(`\d`)
	otherRegx := regexp.MustCompile(`[^\d\s]`)

	found := otherRegx.FindStringIndex(id)
	numbers := numRegx.FindAllString(reverse(id), -1)

	if found != nil {
		return false
	} else if len(numbers) == 1 {
		return false
	}

	var total int
	for i, char := range numbers {
		num, _ := strconv.Atoi(char)
		var mod int
		if i%2 == 1 {
			mod = 2 * num
			if mod > 9 {
				mod -= 9
			}
		} else {
			mod = num
		}
		total += mod
	}
	return total%10 == 0
}

func reverse(str string) string {
	var result string
	for i := 0; i < len(str); i++ {
		result = string(str[i]) + result
	}
	return result
}
