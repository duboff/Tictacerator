require_relative "./cell.rb"

class Board

  attr_reader :cells, :size, :players

  BOARD_SIZE = 3

  def initialize(cells = Array.new(BOARD_SIZE ** 2) { Cell.new })
    @size = BOARD_SIZE
    @cells = cells
  end

  def rows
    cells.each_slice(size).to_a
  end

  def columns
    rows.transpose
  end

  def diagonals
    [rows, rows.reverse].map {|rows| (0...@size).map { |i| rows[i][i] } }
  end

  def te
    rows + columns + diagonals
  end

  def empty?
    cells.all?(&:empty?)
  end

  def won?
    winner
  end

  def drawn?
    !won? && cells.none? { |cell| cell.value.nil? }
  end

  def winner
    return 1 if te.any? { |member| member.map(&:value).uniq == [1] }
    return 0 if te.any? { |member| member.map(&:value).uniq == [0] }
  end

  def place(piece, cell)
    cell.value = piece if cell.empty?
  end

end
