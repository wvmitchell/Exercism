module Pangram
  def self.pangram?(test)
    Set.new(test.downcase.scan(/[a-z]/)).length === 26
  end
end
