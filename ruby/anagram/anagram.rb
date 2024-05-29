class Anagram
  attr_reader :word

  def initialize(word)
    @word = word.downcase
  end

  def match(candidates)
    word_chars = word.chars.sort

    candidates.select do |candidate|
      normed_candiate = candidate.downcase
      word != normed_candiate &&
        normed_candiate.chars.sort == word_chars
    end
  end
end
