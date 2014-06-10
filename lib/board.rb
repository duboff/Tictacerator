require_relative "./cell.rb"

class Board

  attr_reader :cells, :size

  BOARD_SIZE = 3

  def initialize
    @size = BOARD_SIZE
    @cells = Array.new(size ** 2, Cell.new)
  end

  def rows
    cells.each_slice(size).to_a
  end

  def columns
    rows.transpose
  end

  def diagonals
    [rows, rows.reverse].map {|rows| get_diagonal(rows)}
  end

  def get_diagonal(rows)
    (0...@size).map { |i| rows[i][i] }
  end

end