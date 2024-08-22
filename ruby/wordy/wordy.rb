class WordProblem
  # OPERATIONS_HASH maps the operation to the corresponding method
  # @return [Hash<String, Symbol>] the operation to method mapping
  OPERATIONS_HASH = {
    "plus" => :+,
    "minus" => :-,
    "multiplied" => :*,
    "divided" => :/
  }.freeze

  # initialize method
  # @param question [String]
  def initialize(question)
    @valid = valid_question?(question)
    @digits = question.scan(/-?\d+/).map(&:to_i)
    @operations = question.scan(/plus|minus|multiplied|divided/)
  end

  # answer method returns the memoized result of the calculate method
  # @return [Integer]
  def answer
    raise ArgumentError unless @valid

    @answer ||= calculate
  end

  private

  # calculate method performs the operations on the digits
  # @return [Integer]
  def calculate
    result = @digits.shift
    while @operations.any?
      opp = OPERATIONS_HASH[@operations.shift]
      result = result.send(opp, @digits.shift)
    end
    result
  end

  # valid_question? method checks if the question is valid_question
  # ensures that the question contains at least one digit
  # and no ivalid operations
  # @param question [String] the question to validate
  # @return [Boolean]
  def valid_question?(question)
    question.match?(/-?\d+/) && !question.match?(/cubed|raised/)
  end
end
