// Package lasagna provides a set of tools for working with lasagnas.
package lasagna

// PreparationTime calculates the time needed to prepare a lasagna, based on
// a given number of layers and a custom preparation time for each layer.
func PreparationTime(layers []string, time int) int {
	if time == 0 {
		time = 2
	}
	return len(layers) * time
}

// Quantities calculates the amount of noodles and sauce needed to prepare a lasagna,
func Quantities(layers []string) (int, float64) {
	noodles := 0
	sauce := 0.0
	for _, layer := range layers {
		if layer == "noodles" {
			noodles += 50
		} else if layer == "sauce" {
			sauce += 0.2
		}
	}

	return noodles, sauce
}

// AddSecretIngredient adds a secret ingredient to the lasagna, replacing the last ingredient in the toList.
func AddSecretIngredient(fromList []string, toList []string) {
	secret := fromList[len(fromList)-1]
	toList[len(toList)-1] = secret
}

// TODO: define the 'ScaleRecipe()' function
func ScaleRecipe(quantities []float64, portions int) []float64 {
	scaled := make([]float64, len(quantities))
	for i, quantity := range quantities {
		scaled[i] = quantity * float64(portions) / 2.0
	}

	return scaled
}
