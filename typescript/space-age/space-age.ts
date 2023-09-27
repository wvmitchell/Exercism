interface P {
  [key: string]: number
}

const EARTH_YEAR: number = 31557600

const ORBITAL_PERIODS: P = {
  'mercury': 0.2408467,
  'venus': 0.61519726,
  'earth': 1.0,
  'mars': 1.8808158,
  'jupiter': 11.862615,
  'saturn': 29.447498,
  'uranus': 84.016846,
  'neptune': 164.79132
}

export function age(planet: string, seconds: number): number {
  const precise_age = seconds / (EARTH_YEAR * ORBITAL_PERIODS[planet])
  return Number(precise_age.toFixed(2))
}
