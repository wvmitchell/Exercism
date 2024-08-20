class Allergies
  ##
  # ALLERGEN_HASH is a hash that contains the allergen and its score
  # The score is a power of 2, so it can be used as a bit mask
  # The allergen is the key and the score is the value
  #
  # @return [Hash] a hash with allergen and its score
  ALLERGEN_HASH = {
    "eggs" => 1,
    "peanuts" => 2,
    "shellfish" => 4,
    "strawberries" => 8,
    "tomatoes" => 16,
    "chocolate" => 32,
    "pollen" => 64,
    "cats" => 128
  }.freeze

  ##
  # Initialize the Allergies class
  def initialize(score)
    @score = score
  end

  ##
  # allergic_to? checks if the person is allergic to the allergen
  #
  # @param [String] allergen the allergen to check
  # @return [Boolean] true if the person is allergic to the allergen, false otherwise
  def allergic_to?(allergen)
    (@score & ALLERGEN_HASH[allergen]).positive?
  end

  ##
  # list returns the list of allergens that the person is allergic to
  #
  # @return [Array] the list of allergens that the person is allergic to
  def list
    @list ||= ALLERGEN_HASH.keys.filter { |allergen| allergic_to?(allergen) }
  end
end
