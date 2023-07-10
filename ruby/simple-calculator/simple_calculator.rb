class SimpleCalculator
  ALLOWED_OPTS = ['+', '/', '*'].freeze
  class UnsupportedOperation < StandardError; end

  def self.calculate(first_operand, second_operand, operation)
    raise ArgumentError if first_operand.class != Integer
    raise ArgumentError if second_operand.class != Integer
    raise UnsupportedOperation if !ALLOWED_OPTS.include?(operation)

    begin
      result = first_operand.send(operation.to_sym, second_operand)
    rescue ZeroDivisionError
      statement = "Division by zero is not allowed."
    else
      statement = "%d %s %d = %d" %
        [first_operand,
        operation,
        second_operand,
        result]
    ensure
      return statement
    end
  end
end
