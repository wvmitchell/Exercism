module Brackets
  BRACKETS = { "{" => "}", "[" => "]", "(" => ")" }.freeze

  def self.paired?(test_string)
    stack = []
    test_string.each_char do |char|
      stack << char if BRACKETS.key?(char)
      return false if BRACKETS.value?(char) && BRACKETS[stack.pop] != char
    end
    stack.empty?
  end
end
