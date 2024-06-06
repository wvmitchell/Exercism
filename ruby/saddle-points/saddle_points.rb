module Grid
  def self.saddle_points(matrix)
    rows = matrix
    columns = matrix.transpose

    rows.each_with_object([]).with_index do |(row, candidates), i|
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
  end
end
