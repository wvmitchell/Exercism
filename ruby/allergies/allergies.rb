require 'pry'

class Allergies
  def initialize(score)
    @allergen_hash = create_allergen_hash(score)
  end

  def allergic_to?(allergen)
    @allergen_hash[allergen] == '1'
  end

  def list
    @list ||= @allergen_hash.filter do |allergen, positive|
      positive == '1'
    end.keys
  end

  private

  def create_allergen_hash(score)
    digits = score.to_s(2).reverse.split('')[0..9]
    allergens = [
      'eggs',
      'peanuts', 
      'shellfish',
      'strawberries',
      'tomatoes',
      'chocolate',
      'pollen',
      'cats',
    ]
    allergens.zip(digits).to_h
  end
end
