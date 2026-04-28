require_relative '../lib/Game'

RSpec.describe Game do
  describe '#setup' do
    let(:game) { Game.new }
    it 'takes player name and icon' do
      allow(game).to receive(:gets).and_return("Dennis\n", "X\n", 'test', 'test')
      game.setup
      expect(game.players[0].name).to eql('Dennis')
      expect(game.players[0].icon).to eql('X')
    end

    it 'takes second player name and icon' do
      allow(game).to receive(:gets).and_return("Dennis\n", "X\n", "Anna\n", "O\n")
      game.setup
      expect(game.players[1].name).to eql('Anna')
      expect(game.players[1].icon).to eql('O')
    end

    it 'loops for null values' do
      allow(game).to receive(:gets).and_return("\n", "Dennis\n", "\n", "X\n", 'test', 'test')
      game.setup
      expect(game.players[0].name).to eql('Dennis')
      expect(game.players[0].icon).to eql('X')
    end
  end

  describe '#get_column_input' do
    let(:game) { Game.new }
    it 'loops until input is within 1-7' do
      allow(game).to receive(:gets).and_return('8\n', '5\n')
      expect(game.get_column_input).to eql(4)
    end
  end

  describe '#switch_player' do
    let(:game) { Game.new }
    it 'changes to player 2 when player 1 is the current player' do
      game.switch_player
      expect(game.current_player.name).to eql('Player 2')
    end

    it 'changes to player 1 when player 2 is the current player' do
      game.current_player = game.players[1]
      game.switch_player
      expect(game.current_player).to eql(game.players[0])
    end
  end

  describe '#play' do
    # call setup
    # call input
    # call win? and full? from board
    # winning messages!
  end
end
