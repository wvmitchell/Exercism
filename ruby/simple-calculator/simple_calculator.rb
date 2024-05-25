class SimpleCalculator
  class UnsupportedOperation < StandardError
  end

  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  def self.calculate(first_operand, second_operand, operation)
    if [first_operand, second_operand].any? { |op| !op.is_a?(Integer) }
      raise ArgumentError, "Operands must be Integers"
    elsif !ALLOWED_OPERATIONS.include?(operation)
      raise UnsupportedOperation, "Operation not supported"
    end

    begin
      result = first_operand.send(operation.to_sym, second_operand)
    rescue ZeroDivisionError
      "Division by zero is not allowed."
    else
      "#{first_operand} #{operation} #{second_operand} = #{result}"
    end
  end
end
