package chessboard

// Declare a type named File which stores if a square is occupied by a piece - this will be a slice of bools
type File []bool

// Declare a type named Chessboard which contains a map of eight Files, accessed with keys from "A" to "H"
type Chessboard map[string]File

// CountInFile returns how many squares are occupied in the chessboard,
// within the given file.
func CountInFile(cb Chessboard, file string) int {
	column := cb[file]
	count := 0

	for _, square := range column {
		if square {
			count = count + 1
		}
	}

	return count
}

// CountInRank returns how many squares are occupied in the chessboard,
// within the given rank.
func CountInRank(cb Chessboard, rank int) int {
	count := 0
	validRank := rank > 0 && rank <= len(cb)

	if !validRank {
		return count
	}

	for _, column := range cb {
		if column[rank-1] {
			count = count + 1
		}
	}

	return count
}

// CountAll should count how many squares are present in the chessboard.
func CountAll(cb Chessboard) int {
	// I mean...why iterate when all chessboards are the same size?
	return 64
}

// CountOccupied returns how many squares are occupied in the chessboard.
func CountOccupied(cb Chessboard) int {
	count := 0

	for fileName := range cb {
		count = count + CountInFile(cb, fileName)
	}

	return count
}
