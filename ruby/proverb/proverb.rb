class Proverb
  def initialize(*chain, qualifier: '')
    @chain = chain
    @qualifier = qualifier
  end

  def to_s
    main + final
  end

  private

  def main
    @chain.each_cons(2).each_with_object('') do |(word, next_word), str|
      str << "For want of a #{word} the #{next_word} was lost.\n"
    end
  end

  def final
    "And all for the want of a #{@qualifier} #{@chain.first}.".squeeze(' ')
  end
end
