class Board
  def initialize(board)
    @rows = parse_rows(board)
    @columns = @rows.transpose
  end

  def winner
    if winner?('X', @columns)
      'X'
    elsif winner?('O', @rows)
      'O'
    else
      ''
    end
  end

  def winner?(player, rows)
    first_row = rows[0]
    first_row.each_index.any? do |index|
      depth_first_search(player, rows, 0, index)
    end
  end

  def depth_first_search(player, rows, row_idx, column_idx, seen = [])
    is_marked = rows[row_idx][column_idx] == player
    is_last_row = row_idx == rows.length - 1

    if is_marked && is_last_row
      true
    elsif seen.include?([row_idx, column_idx])
      false
    elsif is_marked
      next_steps = get_next_steps(row_idx, column_idx, rows)
      seen.push([row_idx, column_idx])
      next_steps.any? do |next_step|
        depth_first_search(player, rows, next_step[0], next_step[1], seen)
      end
    end
  end

  def get_next_steps(row_idx, column_idx, rows)
    row_length = rows.length
    column_length = rows[0].length

    potentials = [
      [row_idx, column_idx - 1],
      [row_idx, column_idx + 1],
      [row_idx - 1, column_idx],
      [row_idx - 1, column_idx + 1],
      [row_idx + 1, column_idx - 1],
      [row_idx + 1, column_idx]
    ]

    potentials.select do |step|
      step[0] >= 0 && step[0] < row_length && step[1] >= 0 && step[1] < column_length
    end
  end

  def parse_rows(board)
    board.map do |raw_row|
      raw_row.scan(/X|O|\./)
    end
  end
end
