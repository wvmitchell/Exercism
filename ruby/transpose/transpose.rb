module Transpose
  def self.transpose(input)
    matrix = parse_input_to_matrix(input).transpose
    stringify_matrix(matrix)
  end

  def self.parse_input_to_matrix(input)
    rows = input.split("\n")
    max_length = rows.empty? ? 0 : rows.max_by(&:length).length
    rows.map { |raw_row| raw_row.gsub(' ', '*').ljust(max_length).split('') }
  end

  def self.stringify_matrix(matrix)
    matrix.map { |row| row.join('').rstrip.gsub('*', ' ') }.join("\n")
  end
end
