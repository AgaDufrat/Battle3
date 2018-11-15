require 'Game'

describe Game do
  subject(:game) {described_class.new(player_1, player_2)}
  let(:player_1) { double :player1 }
  let(:player_2) { double :player2 }

  describe '#attack' do
    it 'damages the player' do
      expect(player_2).to receive(:receive_damage)
      game.attack(player_2, 10)
    end


  end
end
