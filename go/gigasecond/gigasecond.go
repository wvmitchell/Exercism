// Package gigasecond provides a function to add a gigasecond to a given time
package gigasecond

// import path for the time package from the standard library
import "time"

// AddGigasecond adds a gigasecond to the given time
func AddGigasecond(t time.Time) time.Time {
	return t.Add(time.Second * 1e9)
}
