module Transpose
  extend self

  def transpose(input)
    transposed_matrix = parse_to_matrix(input).transpose
    stringify_matrix(transposed_matrix)
  end

  def parse_to_matrix(input)
    rows = input.lines(chomp: true)
    maximum_length = rows.map(&:size).max
    rows.map do |row|
      row.ljust(maximum_length, "*").chars
    end
  end

  def stringify_matrix(array_matrix)
    array_matrix.map do |row|
      row.join.sub(/\*+\z/, "")
    end.join("\n").tr("*", " ")
  end
end
