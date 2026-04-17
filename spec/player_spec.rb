require_relative '../lib/Player'

RSpec.describe Player do
  describe '#initialize' do
    let(:player) { Player.new('Dennis', 'O') }
    it 'stores a player name' do
      expect(player.name).to eql('Dennis')
    end

    it 'stores a player icon' do
      expect(player.icon).to eql('O')
    end
  end
end
