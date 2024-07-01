// Package interest provides functions to calculate interest rates and balances.
package interest

// InterestRate returns the interest rate for the provided balance.
func InterestRate(balance float64) float32 {
	if balance < 0 {
		return 3.213
	} else if balance < 1000 {
		return 0.5
	} else if balance < 5000 {
		return 1.621
	}
	return 2.475
}

// Interest calculates the interest for the provided balance.
func Interest(balance float64) float64 {
	return balance * float64(InterestRate(balance)) / 100
}

// AnnualBalanceUpdate calculates the annual balance update, taking into account the interest rate.
func AnnualBalanceUpdate(balance float64) float64 {
	return Interest(balance) + balance
}

// YearsBeforeDesiredBalance calculates the minimum number of years required to reach the desired balance.
func YearsBeforeDesiredBalance(balance, targetBalance float64) int {
	// interest rate will increase as the balance increases
	// so we need to calculate the interest rate for each years
	// and update the balance accordingly
	// can be done using a counter an a while loop
	years := 0
	for balance < targetBalance {
		balance = AnnualBalanceUpdate(balance)
		years++
	}
	return years
}
