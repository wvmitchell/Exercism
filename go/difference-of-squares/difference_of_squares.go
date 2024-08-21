// Package diffsquares provides functions to calculate the difference between the square of the sum and the sum of the squares of the first N natural numbers.
package diffsquares

// SquareOfSum returns the square of the sum of the first N natural numbers.
func SquareOfSum(n int) int {
	sum := (n * (1 + n)) / 2
	return sum * sum
}

// SumOfSquares returns the sum of the squares of the first N natural numbers.
func SumOfSquares(n int) int {
	return int((n * (n + 1) * (2*n + 1)) / 6)
}

// Difference returns the difference between the square of the sum and the sum of the squares of the first N natural numbers.
func Difference(n int) int {
	return SquareOfSum(n) - SumOfSquares(n)
}
