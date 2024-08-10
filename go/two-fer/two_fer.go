// Package twofer implements a simple library that implements a simple two-fer function.
package twofer

import "fmt"

// ShareWith returns a string that says "One for you, one for me." if no name is provided, or "One for X, one for me." if a name is provided.
func ShareWith(name string) string {
	if name == "" {
		name = "you"
	}
	return fmt.Sprintf("One for %s, one for me.", name)
}
