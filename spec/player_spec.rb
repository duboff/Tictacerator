require 'player'



shared_examples_for 'a player' do
  it 'should know its board' do
    expect(player.board).to eq board
  end
  it 'should know its board' do
    expect(player.board).to eq board
  end

  it 'should have a default piece' do
    expect(player.mark).to eq 1
  end

  it 'can make a move' do
    player.move(cell)
    expect(player.board.cells.first.value).to eq 1
    expect(cell.value).to eq 1
  end

  it 'can only move if the space is empty' do
    filled_cell.value = 0
    expect(filled_cell.value).to eq 0
    player.move(filled_cell)
    expect(player.board.cells.last.value).to eq 0
    expect(filled_cell.value).to eq 0
  end
end



describe Player do
  it_behaves_like 'a player' do
    let(:board) {Board.new}
    let(:player) { Player.new(board, :x) }
    let(:cell) {player.board.cells.first}
    let(:filled_cell) {player.board.cells.last}
  end

end

describe HumanPlayer do
  context 'still a player' do
    it_behaves_like 'a player' do
      let(:board) {Board.new}
      let(:player) { HumanPlayer.new(board, :x) }
      let(:cell) {player.board.cells.first}
      let(:filled_cell) {player.board.cells.last}
    end
  end
end

describe ComputerPlayer do
  context 'still a player' do
    it_behaves_like 'a player' do
      let(:board) {Board.new}
      let(:player) { ComputerPlayer.new(board, :x) }
      let(:cell) {player.board.cells.first}
      let(:filled_cell) {player.board.cells.last}
    end
  end
end
