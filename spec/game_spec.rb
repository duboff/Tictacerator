require 'game'
require 'board'
require 'cell'
require 'player'

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
    it 'initially board is empty' do
      expect(game.board).to be_empty
    end
    it 'game is over when board is won' do
      game.board.rows.first.each { |cell| cell.value = 1 }
      expect(game).to be_over
    end
  end

  context 'Winner' do
    it 'has a winner when the board is won' do
      game.board.rows.first.each { |cell| cell.value = 1 }
      expect(game.winner).to eq game.players.first
    end
    it 'has no winner when board is drawn' do
      draw = [1,0,1,0,1,1,0,1,0]
      game.board.cells.each_with_index {|cell,i| cell.value = draw[i]}
      expect(game.winner).to be_nil
    end
  end

  context 'Playing' do
    it 'players can put pieces on board' do
      player = game.players.first
      cell = game.board.cells.first
      game.move(player, cell)
      expect(game.board.cells.first.value).to eq 1
    end
  end


end
