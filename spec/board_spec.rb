require_relative '../lib/Board'

RSpec.describe Board do
  describe '#initialize' do
    let(:board) { Board.new }
    it 'creates a 6x7 array grid' do
      expect(board.grid.length).to eql(6)
      expect(board.grid).to all(have_attributes(length: 7))
      expect(board.grid).to all(all(eq('-')))
    end
  end
end
