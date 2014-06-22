class Game
  attr_reader :players, :board

  def initialize
    @board = Board.new
    @players = [HumanPlayer.new(board, :x), ComputerPlayer.new(board, :o)]
  end

  def over?
  	board.won? || board.drawn?
  end
end
