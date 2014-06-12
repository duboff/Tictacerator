require 'board'

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
