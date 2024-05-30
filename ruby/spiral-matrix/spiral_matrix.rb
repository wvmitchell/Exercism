require 'pry'

class SpiralMatrix
  attr_reader :size

  def initialize(size)
    @size = size
  end

  def matrix
    @matrix ||= generate_matrix
  end

  private

  def generate_matrix
    elements = (1..size**2).to_a
    starting_matrix = elements.length.odd? ? [[elements.pop]] : []

    wrap_matrix(starting_matrix, elements, starting_matrix.length + 1) while elements.any?

    starting_matrix
  end

  def wrap_matrix(matrix, elements, section_length)
    matrix = wrap_left(matrix, elements, section_length)
    matrix = wrap_bottom(matrix, elements, section_length)
    matrix = wrap_right(matrix, elements, section_length)
    wrap_top(matrix, elements, section_length)
  end

  def wrap_left(matrix, elements, section_length)
    (0...section_length).each do |i|
      if matrix[i].nil?
        matrix[i] = [elements.pop]
      else
        matrix[i].unshift(elements.pop)
      end
    end
    matrix
  end

  def wrap_bottom(matrix, elements, section_length)
    to_push = elements.pop(section_length)
    matrix[-1] += to_push.reverse
    matrix
  end

  def wrap_right(matrix, elements, section_length)
    (matrix.length - 1).downto(0) do |i|
      if i == 0
        matrix.unshift([elements.pop])
      else
        matrix[i-1].push(elements.pop)
      end
    end

    matrix
  end

  def wrap_top(matrix, elements, section_length)
    matrix[0].unshift(*elements.pop(section_length))
  end
end
