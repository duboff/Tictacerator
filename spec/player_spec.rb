require 'player'

describe Player do
  context 'basic functionality' do
    let(:board) {Board.new}
    let(:player) { Player.new(board, :x) }

    it 'should know its board' do
      expect(player.board).to eq board
    end

    it 'should have a default piece' do
      expect(player.mark).to eq 1
    end
  end
end
