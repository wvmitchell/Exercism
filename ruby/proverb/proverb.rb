class Proverb
  def initialize(*chain, qualifier: nil)
    @chain = chain
    @qualifier = qualifier ? "#{qualifier} " : ''
  end

  def to_s
    @chain[0..-2].each_with_object('').with_index do |(word, str), i|
      next_word = @chain[i + 1]
      str << "For want of a #{word} the #{next_word} was lost.\n"
    end + "And all for the want of a #{@qualifier + @chain[0]}."
  end
end
