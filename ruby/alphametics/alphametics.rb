module Alphametics
  def self.solve(puzzle)
    letters = puzzle.scan(/[A-Z]/).uniq

    test_cases = create_test_cases(letters)

    test_cases.find do |test_case|
      equation = puzzle.gsub(/[A-Z]/) { |letter| test_case[letter] }
      begin
        valid(equation) && eval(equation)
      rescue StandardError, SyntaxError
        false
      end
    end || {}
  end

  def self.create_test_cases(letters)
    test_cases = []
    (0..9)
      .to_a
      .permutation(letters.length) do |permutation|
        test_cases << Hash[letters.zip(permutation)]
      end
    test_cases
  end

  def self.valid(equation)
    equation.match?(/^((?!0)\d+\s\+\s)+(?!0)\d+\s={2}\s(?!0)\d+$/)
  end
end
