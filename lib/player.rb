require 'board'

class Player

  attr_accessor :board, :score
  attr_reader :piece

  def initialize(board, piece)
    @board = board
    @piece = piece
    @score = 0
  end

  def mark
    piece == :x ? 1 : 0
  end

  def move(cell)
    board.place(mark,cell)
  end

  def type
  end
end

class HumanPlayer < Player
  def type
    :human
  end

end

class ComputerPlayer < Player
  def available_cells
    board.cells.select(&:empty?)
  end
  def type
    :computer
  end
end
