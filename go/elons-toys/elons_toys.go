// Package elon contains the implementation of the toy car
package elon

import "fmt"

// Drive updates the distance and battery of a Car
func (c *Car) Drive() {
	if c.battery >= c.batteryDrain {
		c.distance += c.speed
		c.battery -= c.batteryDrain
	}
}

// DisplayDistance displays the distance a car has traveled
func (c *Car) DisplayDistance() string {
	return fmt.Sprintf("Driven %d meters", c.distance)
}

// DisplayBattery displays the battery remaining for a car
func (c *Car) DisplayBattery() string {
	return fmt.Sprintf("Battery at %d%%", c.battery)
}

// CanFinish returns a bool, depeding on if a car has enough battery to finish
func (c *Car) CanFinish(trackDistance int) bool {
	maxDistance := (c.battery / c.batteryDrain) * c.speed
	return maxDistance >= trackDistance
}
