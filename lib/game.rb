class Game
  attr_reader :players, :board

  def initialize
    @board = Board.new
    @players = [HumanPlayer.new(board, :x), ComputerPlayer.new(board, :o)]
  end

  def over?
    board.won? || board.drawn?
  end

  def winner
    return players.first if board.winner == 1
    return players.last if board.winner == 0
  end

  def move(player,cell)
    piece = [1,0][players.find_index(player)]
    board.place(piece,cell)
  end

end
