class Player

  attr_accessor :board
  attr_reader :piece

  def initialize(board, piece)
    @board = board
    @piece = piece
  end

  def mark
    piece == :x ? 1 : 0
  end

  def move(cell)
    cell.value = mark if cell.empty?
  end
end

class HumanPlayer < Player

end

class ComputerPlayer < Player

end
