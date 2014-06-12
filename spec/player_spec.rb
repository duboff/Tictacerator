require 'player'

describe Player do
  context 'basic functionality' do
    let(:board) {Board.new}
    let(:player) { Player.new(board) }

    it 'should know its board' do
      expect(player.board).to eq board
    end
  end
end
