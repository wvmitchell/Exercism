class Minesweeper
  # annotate method
  # @param board [Array<String>] Board
  # @return [Array<String>] Board
  def self.annotate(board)
    parsed = parse_board(board)
    marked = mark_mines(parsed)
    compact_board(marked)
  end

  # parse_board method turns an array of strings into a 2d array
  # @param board [Array<string>] Board
  # @return [Array<Array<String>>] 2d Array
  def self.parse_board(board)
    board.map(&:chars)
  end

  # mark_mines method marks mines on the board, and the number of mines surrounding each cell
  # @sg-ignore
  # @param board [Array<Array<String>>] 2d Array
  # @return [Array<Array<String>>] 2d Array
  def self.mark_mines(board)
    board.map.with_index do |row, i|
      row.map.with_index do |cell, j|
        if cell == "*"
          "*"
        else
          count_mines(board, i, j)
        end
      end
    end
  end

  # count_mines method counts the number of mines surrounding a cell
  # @param board [Array<Array<String>>] 2d Array
  # @param i [Integer] Row Index
  # @param j [Integer] Column Index
  # @return [String] Number of mines surrounding the cell
  def self.count_mines(board, i, j)
    count = 0
    (-1..1).each do |x|
      (-1..1).each do |y|
        next unless valid_cell(board, i + x, j + y)

        cell = board[i + x][j + y]
        count += 1 if cell == "*"
      end
    end
    count.zero? ? " " : count.to_s
  end

  # compact_board method turns a 2d array into an array of strings
  # @param board [Array<Array<String>>] 2d Array
  # @return [Array<String>] Board
  def self.compact_board(board)
    board.map(&:join)
  end

  # valid_cell method checks if a cell is in bounds
  # @param board [Array<Array<String>>] 2d Array
  # @param x [Integer] Row Index
  # @param y [Integer] Column Index
  # @return [Boolean] True if cell is in bounds, False otherwise
  def self.valid_cell(board, x, y)
    !x.negative? && !y.negative? && x < board.length && y < board[0].length
  end
end
