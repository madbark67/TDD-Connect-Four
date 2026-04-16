class Board
  ROWS = 6
  COLS = 7

  attr_accessor :grid

  def initialize
    @grid = Array.new(6) { Array.new(7) }
  end

  def row_check(row, icon)
    grid[row].each_cons(4) do |four|
      return true if four.all? { |value| value == icon }
    end
    false
  end
end
