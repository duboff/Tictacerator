class Game
  attr_reader :players, :board

  def initialize(players = [HumanPlayer.new(board, :x), ComputerPlayer.new(board, :o)])
    @board = Board.new
    @players = players
    @next_turn = players.first
  end

  def over?
    board.won? || board.drawn?
  end

  def winner
    return players.first if board.winner == 1
    return players.last if board.winner == 0
  end

  def loser
    players[players.find_index(winner) + 1]
  end

  # def move(player,cell)
  #   piece = [1,0][players.find_index(player)]
  #   board.place(piece,cell)
  #   @next_turn
  # end

  def next_turn
    board.cells.map(&:value).count(nil).odd? ? players.first : players.last
  end

  def score
    winner.score += 1
    loser.score -= 1
  end

end
