require 'board'

describe Board do
  let(:board) {Board.new}

  context 'on creation' do
    it 'has 9 cells' do
      expect(board.cells.count).to eq 9
    end
  end
end