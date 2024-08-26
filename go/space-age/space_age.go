// Package space provides a simple way to calculate age on different planets.
package space

// Planet is a type alias for string
type Planet string

var planets = map[Planet]float64{
	"Mercury": 31557600 * 0.2408467,
	"Venus":   31557600 * 0.61519726,
	"Earth":   31557600,
	"Mars":    31557600 * 1.8808158,
	"Jupiter": 31557600 * 11.862615,
	"Saturn":  31557600 * 29.447498,
	"Uranus":  31557600 * 84.016846,
	"Neptune": 31557600 * 164.79132,
}

// Age calculates the age on a given planet.
func Age(seconds float64, planet Planet) float64 {
	orbitalPeriod := planets[planet]
	if orbitalPeriod == 0 {
		return -1
	}
	return seconds / planets[planet]
}
