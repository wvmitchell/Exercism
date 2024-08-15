// Package gigasecond provides a function to add a gigasecond to a given time
package gigasecond

import "time"

// AddGigasecond adds a gigasecond to the given time
func AddGigasecond(t time.Time) time.Time {
	return t.Add(time.Second * 1e9)
}
