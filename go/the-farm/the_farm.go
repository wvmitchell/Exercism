// Package thefarm provides functions for dividing food between cows.
package thefarm

import (
	"errors"
	"fmt"
	"strconv"
)

// DivideFood divides the given amount of food between the given number of cows.
func DivideFood(calculator FodderCalculator, cows int) (float64, error) {
	amount, err := calculator.FodderAmount(cows)
	if err != nil {
		return 0, err
	}

	factor, err := calculator.FatteningFactor()
	if err != nil {
		return 0, err
	}

	return (amount * factor) / float64(cows), nil
}

// ValidateInputAndDivideFood checks the input, then calls DivideFood
func ValidateInputAndDivideFood(calculator FodderCalculator, cows int) (float64, error) {
	if cows <= 0 {
		return 0, errors.New("invalid number of cows")
	}

	amount, err := DivideFood(calculator, cows)
	if err != nil {
		return 0, err
	}

	return amount, nil
}

// InvaildNumCowsError is a special error for invalid cow numbers
type InvaildNumCowsError struct {
	Quantity int
	Message  string
}

func (e *InvaildNumCowsError) Error() string {
	quantityStr := strconv.Itoa(e.Quantity)
	return fmt.Sprintf("%s cows are invalid: %s", quantityStr, e.Message)
}

// ValidateNumberOfCows validates the quantity of cows
func ValidateNumberOfCows(cows int) error {
	if cows == 0 {
		return &InvaildNumCowsError{
			Quantity: 0,
			Message:  "no cows don't need food",
		}
	} else if cows < 0 {
		return &InvaildNumCowsError{
			Quantity: cows,
			Message:  "there are no negative cows",
		}
	}
	return nil
}
