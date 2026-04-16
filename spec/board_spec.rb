require_relative '../lib/Board'

RSpec.describe Board do
  describe '#initialize' do
    let(:board) { Board.new }
    it 'creates a 6x7 array grid with nil values' do
      expect(board.grid.length).to eql(6)
      expect(board.grid).to all(have_attributes(length: 7))
      expect(board.grid).to all(all(be(nil)))
    end
  end

  describe '#row_check' do
    let(:board) { Board.new }
    it 'checks if 4 in a row of the same icon returns true' do
      board.grid[0][0..3] = %w[X X X X]

      expect(board.row_check(0, 'X')).to be(true)
    end

    it 'checks if 4 in a row of the different icons returns false' do
      board.grid[0][0..1] = %w[X X]
      board.grid[0][2..3] = %w[O O]

      expect(board.row_check(0, 'X')).to be(false)
    end

    it 'checks 4 of the same icons not in a row returns false' do
      board.grid[0][0] = 'X'
      board.grid[0][2] = 'X'
      board.grid[0][3] = 'X'
      board.grid[0][5] = 'X'

      expect(board.row_check(0, 'X')).to be(false)
    end
  end
end
