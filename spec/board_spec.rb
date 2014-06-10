require 'board'

describe Board do
  let(:board) {Board.new}

  context 'on creation' do
    it 'has 9 cells' do
      expect(board.cells.count).to eq 9
    end
    it 'has only empty cells' do
      expect(board.cells.map(&:value).uniq).to eq [nil]
    end
  end
  context 'groups' do
    it 'rows' do
      expect(board.rows.first).to eq board.cells[0..2]
    end
    it 'columns' do
      expect(board.columns.first).to eq [] << board.cells[0] << board.cells[3] << board.cells[6]
    end
    it 'diagonals' do
      expect(board.diagonals.first).to eq [] << board.cells[0] << board.cells[4] << board.cells[8]
      expect(board.diagonals.last).to eq [] << board.cells[2] << board.cells[4] << board.cells[6]
    end
  end
end