class Matrix
  def initialize(raw)
    @rows = parse(raw)

    # hand rolled for practice, but could just use @rows.transpose
    @columns = transpose(@rows)
  end

  def row(num)
    @rows[num - 1]
  end

  def column(num)
    @columns[num - 1]
  end

  private

  def parse(raw)
    raw.split("\n").map do |row_str|
      row_str.split(' ').map(&:to_i)
    end
  end

  def transpose(matrix)
    num_cols = matrix[0].length

    (0...num_cols).map do |index|
      matrix.map do |row|
        row[index]
      end
    end
  end
end
