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
end



describe Player do
  it_behaves_like 'a player' do
    let(:board) {Board.new}
    let(:player) { Player.new(board, :x) }
  end

end

describe HumanPlayer do
  context 'still a player' do
    it_behaves_like 'a player' do
      let(:board) {Board.new}
      let(:player) { HumanPlayer.new(board, :x) }
    end
  end
end

describe ComputerPlayer do
  context 'still a player' do
    it_behaves_like 'a player' do
      let(:board) {Board.new}
      let(:player) { ComputerPlayer.new(board, :x) }
    end
  end
end
