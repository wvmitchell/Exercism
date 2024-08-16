// Package hamming provides a function the compute distance between dna strands
package hamming

import "fmt"

// Distance computes the distance between two strands
func Distance(a, b string) (int, error) {
	if len(a) != len(b) {
		return 0, fmt.Errorf("Strands %s and %s are not of the same length", a, b)
	}

	var difference int
	for i := range a {
		if a[i] != b[i] {
			difference++
		}
	}
	return difference, nil
}
