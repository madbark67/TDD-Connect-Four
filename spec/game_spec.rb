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
end
