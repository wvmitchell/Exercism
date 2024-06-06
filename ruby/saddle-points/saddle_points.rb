module Grid
  def self.saddle_points(matrix)
    # a point in the matrix is a candidate if
    # it is the single largest tree in a row
    # and the single smallest tree in a column
    # use the matrix, and make a transposed copy for the columns
    # create a return object
    # loop through the whole matrix
    # if a row has a single largest tree
    # determine if that tree is also the smallest in the column

    rows = matrix
    columns = matrix.transpose
    candidates = []

    rows.each_with_index do |row, i|
      next unless row.length.positive?

      row_max = row.max

      row.each_with_index do |tree, j|
        column_min = columns[j].min

        is_candidate = tree == row_max && tree == column_min

        next unless is_candidate

        candidates.push(
          {
            "row" => i + 1,
            "column" => j + 1
          }
        )
      end
    end

    candidates
  end
end
