require_relative "./cell.rb"

class Board

  attr_reader :cells

  BOARD_SIZE = 9

  def initialize
    @cells = Array.new(BOARD_SIZE, Cell.new)
  end

  def rows
    cells.each_slice(3).to_a
  end

end