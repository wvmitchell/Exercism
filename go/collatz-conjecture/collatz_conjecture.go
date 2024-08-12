// Package collatzconjecture provides a function to calculate the number of steps required to reach 1 using the Collatz Conjecture
package collatzconjecture

import "fmt"

// CollatzConjecture calculates the number of steps required to reach 1 using the Collatz Conjecture
func CollatzConjecture(n int) (int, error) {
	if n <= 0 {
		return 0, fmt.Errorf("Numbers less than 1 are invalid: %d", n)
	}
	var steps int
	for n > 1 {
		steps++
		if odd(n) {
			n = n*3 + 1
		} else {
			n = n / 2
		}
	}
	return steps, nil
}

func odd(n int) bool {
	return n%2 == 1
}
