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

    wrap_matrix(starting_matrix, elements) while elements.any?

    starting_matrix
  end

  def wrap_matrix(matrix, elements)
    matrix = wrap_left(matrix, elements)
    matrix = wrap_bottom(matrix, elements)
    matrix = wrap_right(matrix, elements)
    wrap_top(matrix, elements)
  end

  def wrap_left(matrix, elements)
    (0..matrix.length).each do |i|
      if matrix[i].nil?
        matrix[i] = [elements.pop]
      else
        matrix[i].unshift(elements.pop)
      end
    end
    matrix
  end

  def wrap_bottom(matrix, elements)
    to_push = elements.pop(matrix.length)
    matrix[-1] += to_push.reverse
    matrix
  end

  def wrap_right(matrix, elements)
    (matrix.length - 1).downto(0) do |i|
      if i.zero?
        matrix.unshift([elements.pop])
      else
        matrix[i - 1].push(elements.pop)
      end
    end

    matrix
  end

  def wrap_top(matrix, elements)
    matrix[0].unshift(*elements.pop(matrix.length - 1))
  end
end
