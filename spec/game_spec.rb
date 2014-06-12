require 'game'

describe Game do

  let(:game) {Game.new}

  context 'Players' do
    it 'should have two players' do
      expect(game.players.count).to eq 2
    end
  end
end
