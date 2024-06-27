// Package cards provides functions for working with slices of integers.
package cards

// FavoriteCards returns a slice with the cards 2, 6 and 9 in that order.
func FavoriteCards() []int {
	return []int{2, 6, 9}
}

// GetItem retrieves an item from a slice at given position.
// If the index is out of range, we want it to return -1.
func GetItem(slice []int, index int) int {
	if indexInRange(slice, index) {
		return slice[index]
	}
	return -1
}

func indexInRange(slice []int, index int) bool {
	return index >= 0 && index < len(slice)
}

// SetItem writes an item to a slice at given position overwriting an existing value.
// If the index is out of range the value needs to be appended.
func SetItem(slice []int, index, value int) []int {
	if indexInRange(slice, index) {
		slice[index] = value
		return slice
	}
	return append(slice, value)
}

// PrependItems adds an arbitrary number of values at the front of a slice.
func PrependItems(slice []int, values ...int) []int {
	return append(values, slice...)
}

// RemoveItem removes an item from a slice by modifying the existing slice.
func RemoveItem(slice []int, index int) []int {
	if indexInRange(slice, index) {
		left := slice[:index]
		right := slice[(index + 1):]
		return append(left, right...)
	}
	return slice
}
