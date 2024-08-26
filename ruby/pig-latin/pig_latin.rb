module PigLatin
  def self.translate(phrase)
    phrase.split.map { |word| translate_word(word) }.join(" ")
  end

  def self.translate_word(word)
    letters = ""

    if rule_one_applies(word)
      return "#{word}ay"
    elsif rule_two_applies(word)
      letters = word.match(/^[^aeiou]+/).to_s
    elsif rule_three_applies(word)
      letters = word.match(/^[^aeiou]*qu/).to_s
    elsif rule_four_applies(word)
      letters = word.match(/^[^aeiouy]+(?=y)/).to_s
    end

    "#{word[letters.length..]}#{letters}ay"
  end

  def self.rule_one_applies(word)
    word =~ /^[aeiou]|xr|yt/ && !rule_three_applies(word) &&
      !rule_four_applies(word)
  end

  def self.rule_two_applies(word)
    word =~ /^[^aeiou]+/ && !rule_three_applies(word) &&
      !rule_four_applies(word)
  end

  def self.rule_three_applies(word)
    word =~ /^[^aeiou]*qu/
  end

  def self.rule_four_applies(word)
    word =~ /^[^aeiouy]+(?=y)/
  end
end
