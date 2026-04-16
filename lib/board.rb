class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(6) { Array.new(7, '-') }
  end
end
