class Allergies
  ALLERGEN_HASH = {
      'eggs' => 1,
      'peanuts' => 2, 
      'shellfish' => 4,
      'strawberries' => 8,
      'tomatoes' => 16,
      'chocolate' => 32,
      'pollen' => 64,
      'cats' => 128,
  }

  def initialize(score)
    @score = score
  end

  def allergic_to?(allergen)
    @score & ALLERGEN_HASH[allergen] > 0
  end

  def list
    @list ||= ALLERGEN_HASH.keys.filter {|allergen| allergic_to?(allergen)}
  end
end
