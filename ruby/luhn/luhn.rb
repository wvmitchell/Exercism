module Luhn
  def self.valid?(digit_string)
    # return false if digit_string.scan(/\d/).length < 2
    # return false if digit_string.scan(/(\d|\s)/).length != digit_string.length

    sum = digit_string
          .gsub(/\s/, '')
          .tap { |str| return false unless str[/\A\d\d+\z/] }
          .scan(/\d/)
          .reverse
          .each.with_index
          .reduce(0) do |total, (d, i)|
            modified = d.to_i > 4 ? (d.to_i * 2) % 10 + 1 : d.to_i * 2
            value = (i % 2).odd? ? modified : d.to_i
            total + value
          end

    (sum % 10).zero?
  end
end
