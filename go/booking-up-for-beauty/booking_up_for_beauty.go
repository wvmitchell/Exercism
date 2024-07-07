package booking

import (
	"time"
)

// Schedule returns a time.Time from a string containing a date.
func Schedule(date string) time.Time {
	// Mon Jan 2 15:04:05 -0700 MST 2006
	t, e := time.Parse("1/2/2006 15:04:05", date)

	if e != nil {
		panic(e)
	}
	return t
}

// HasPassed returns whether a date has passed.
func HasPassed(date string) bool {
	currentTime := time.Now()
	past, e := time.Parse("January 2, 2006 15:04:05", date)

	if e != nil {
		panic(e)
	}

	return currentTime.After(past)
}

// IsAfternoonAppointment returns whether a time is in the afternoon.
func IsAfternoonAppointment(date string) bool {
	appointmentTime, e := time.Parse("Monday, January 2, 2006 15:04:05", date)

	if e != nil {
		panic(e)
	}

	return appointmentTime.Hour() >= 12 && appointmentTime.Hour() < 18
}

// Description returns a formatted string of the appointment time.
func Description(date string) string {
	parsedTime, e := time.Parse("1/2/2006 15:04:05", date)

	if e != nil {
		panic(e)
	}

	//return "You have an appointment on Monday, June 6, 2005, at 10:30."
	return parsedTime.Format("You have an appointment on Monday, January 2, 2006, at 15:04.")
}

// AnniversaryDate returns a Time with this year's anniversary.
func AnniversaryDate() time.Time {
	openingDay, e := time.Parse("January 2 2006", "September 15 2012")
	currentTime := time.Now()
	yearsOld := currentTime.Year() - openingDay.Year()

	if e != nil {
		panic(e)
	}

	return openingDay.AddDate(yearsOld, 0, 0)
}
