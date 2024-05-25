module Reverser
  def self.reverse(str)
    # easy: str.reverse

    # but why be easy when practicing!
    str.length <= 1 ? str : str[-1] + reverse(str[0..-2])
  end
end
