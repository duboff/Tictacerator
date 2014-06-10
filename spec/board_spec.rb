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
      expect(board.diagonals.first).to eq [board.cells[0], board.cells[4], board.cells[8]]
      expect(board.diagonals.last.reverse).to eq [board.cells[2], board.cells[4], board.cells[6]]
    end
  end

  context 'status' do
    it 'empty on creation' do
      expect(board).to be_empty
    end
    it 'registers a row win' do
      expect(board).not_to be_won
      board.rows.first.each { |cell| cell.value = 1 }
      expect(board).to be_won
    end

    it 'registers a column win' do
      expect(board).not_to be_won
      board.columns.first.each { |cell| cell.value = 0}
      expect(board).to be_won
    end

    it 'registers a diagonal win' do
      expect(board).not_to be_won
      board.diagonals.last.each { |cell| cell.value = 0}
      expect(board).to be_won
    end

    it 'doesn not register a win when there is no win' do
      expect(board).not_to be_won
      board.cells.first.value = 1
      board.cells[1].value = 1
      board.cells[2].value = 0
      expect(board).not_to be_won
    end

    it 'registers a draw' do
      draw = [1,0,1,0,1,1,0,1,0]
      board.cells.each_with_index {|cell,i| cell.value = draw[i]}
      expect(board).not_to be_won
      expect(board).to be_drawn
    end



  end

end
