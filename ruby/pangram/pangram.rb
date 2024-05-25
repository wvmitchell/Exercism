module Pangram
  def self.pangram?(sentence)
    sentence.downcase.scan(/[a-z]/).uniq.size == 26
  end
end
