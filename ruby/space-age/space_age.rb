ORBITAL_PERIODS = {
  mercury: 0.2408467,
  venus: 0.61519726,
  earth: 1.0,
  mars: 1.8808158,
  jupiter: 11.862615,
  saturn: 29.447498,
  uranus: 84.016846,
  neptune: 164.79132
}.freeze

SECONDS_IN_EARTH_YEAR = 31_557_600.0

class SpaceAge
  attr_reader :on_earth

  def initialize(seconds)
    @on_earth = seconds / SECONDS_IN_EARTH_YEAR
  end

  ORBITAL_PERIODS.each do |planet, period|
    define_method "on_#{planet}" do
      @on_earth / period
    end
  end
end
