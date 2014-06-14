require 'game'

describe Game do

  let(:game) {Game.new}

  context 'Players' do
    it 'should have two players' do
      expect(game.players.count).to eq 2
    end
    it 'should have one computer player' do
      expect(game.players.map(&:type).count(:computer)).to eq 1
    end
    it 'should have one human player' do
      expect(game.players.map(&:type).count(:human)).to eq 1
    end
  end

  context 'Board' do
    it 'should have a board on creation' do
      expect(game.board.class).to eq Board
    end
  end


end
