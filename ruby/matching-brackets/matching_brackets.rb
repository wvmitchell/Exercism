module Brackets
  BRAKETS = { '{' => '}', '[' => ']', '(' => ')' }

  def self.paired?(test_string)
    stack = []
    chars = test_string.each_char do |char|
      case char
      when '{', '[', '('
        stack.push(char)
      when '}', ']', ')'
        top = stack.pop
        return false if BRAKETS[top] != char
      end
    end
    stack.empty?
  end
end
