class Board
  ROWS = 6
  COLS = 7

  attr_accessor :grid

  def initialize
    @grid = Array.new(6) { Array.new(7) }
  end

  def row_check(row, icon)
    four_in_row?(grid[row], icon)
  end

  def column_check(column, icon)
    column_array = grid.map { |row| row[column] }
    four_in_row?(column_array, icon)
  end

  def diagonal_right_check(row, column, icon)
    # write this
  end

  private

  def four_in_row?(array, icon)
    array.each_cons(4) do |four|
      return true if four.all? { |value| value == icon }
    end
    false
  end
end
