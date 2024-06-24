module BaseConverter
  def self.convert(input_base, digits, output_base)
    raise ArgumentError if input_base <= 1 || output_base <= 1
    raise ArgumentError if digits.any?(&:negative?)
    raise ArgumentError if digits.any? { |digit| digit >= input_base }

    num = find_integer(input_base, digits)
    convert_to_base(num, output_base)
  end

  def self.find_integer(input_base, digits)
    digits
      .map
      .with_index { |digit, i| digit * input_base ** (digits.length - 1 - i) }
      .sum
  end

  def self.convert_to_base(num, output_base)
    digits = []
    while num.positive?
      num, remainder = num.divmod(output_base)
      digits.unshift(remainder)
    end

    digits.empty? ? [0] : digits
  end
end
