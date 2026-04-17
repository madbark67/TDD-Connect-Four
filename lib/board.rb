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
    start_row = row - [row, column].min
    start_col = column - [row, column].min
    right_array = []
    while start_col < COLS && start_row < ROWS
      right_array << grid[start_row][start_col]
      start_col += 1
      start_row += 1
    end
    four_in_row?(right_array, icon)
  end

  def diagonal_left_check(row, column, icon)
    start_row = row - [row, COLS - 1 - column].min
    start_col = column + [row, COLS - 1 - column].min
    left_array = []
    while start_row < ROWS && start_col >= 0
      left_array << grid[start_row][start_col]
      start_col -= 1
      start_row += 1
    end
    four_in_row?(left_array, icon)
  end

  def win?(row, column, icon)
    row_check(row, icon) ||
      column_check(column, icon) ||
      diagonal_right_check(row, column, icon) ||
      diagonal_left_check(row, column, icon)
  end

  def full?
    grid.flatten.none?(nil)
  end

  def column_full?(column)
    grid.all? { |row| !row[column].nil? }
  end

  def add_piece(column, icon)
    grid.reverse_each do |row|
      if row[column].nil?
        row[column] = icon
        return
      end
    end
  end

  private

  def four_in_row?(array, icon)
    array.each_cons(4) do |four|
      return true if four.all? { |value| value == icon }
    end
    false
  end
end
