// Package meteorology provides types and functions to work with meteorological data.
package meteorology

import "fmt"

// TemperatureUnit represents a unit of temperature
type TemperatureUnit int

// Constants for the TemperatureUnit type
const (
	Celsius    TemperatureUnit = 0
	Fahrenheit TemperatureUnit = 1
)

// Add a String method to the TemperatureUnit type
func (tu TemperatureUnit) String() string {
	if tu == Celsius {
		return "°C"
	}
	return "°F"
}

// Temperature represents a temperature value
type Temperature struct {
	degree int
	unit   TemperatureUnit
}

// Add a String method to the Temperature type
func (t Temperature) String() string {
	return fmt.Sprintf("%d %s", t.degree, t.unit)
}

// SpeedUnit represents a unit of speed
type SpeedUnit int

// Constants for the SpeedUnit type
const (
	KmPerHour    SpeedUnit = 0
	MilesPerHour SpeedUnit = 1
)

func (su SpeedUnit) String() string {
	if su == 0 {
		return "km/h"
	}
	return "mph"
}

// Speed represents a speed value
type Speed struct {
	magnitude int
	unit      SpeedUnit
}

// Add a String method to Speed
func (s Speed) String() string {
	return fmt.Sprintf("%d %s", s.magnitude, s.unit)
}

// MeteorologyData represent meteorological data at a given location
type MeteorologyData struct {
	location      string
	temperature   Temperature
	windDirection string
	windSpeed     Speed
	humidity      int
}

// Add a String method to MeteorologyData
func (md MeteorologyData) String() string {
	return fmt.Sprintf("%s: %d %s, Wind %s at %d %s, %d%% Humidity", md.location, md.temperature.degree, md.temperature.unit, md.windDirection, md.windSpeed.magnitude, md.windSpeed.unit, md.humidity)
}
