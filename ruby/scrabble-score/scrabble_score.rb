class Scrabble
  LETTER_VALUES = {
    /[aeioulnrst]/ => 1,
    /[dg]/ => 2,
    /[bcmp]/ => 3,
    /[fhvwy]/ => 4,
    /k/ => 5,
    /[jx]/ => 8,
    /[qz]/ => 10
  }.freeze

  def initialize(word)
    @word = word.downcase
  end

  def score
    LETTER_VALUES.reduce(0) do |total, (letters, value)|
      total + @word.scan(letters).count * value
    end
  end
end
