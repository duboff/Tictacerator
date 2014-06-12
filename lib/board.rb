require_relative "./cell.rb"

class Board

  attr_reader :cells, :size, :players

  BOARD_SIZE = 3

  def initialize
    @size = BOARD_SIZE
    @cells = Array.new(size ** 2) { Cell.new }
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

  def empty?
    cells.all?(&:empty?)
  end

  def won?
    [rows, columns, diagonals].any? do |group|
      group.any? { |member| [[0],[1]].include?(member.map(&:value).uniq) }
    end
  end

  def drawn?
    !won? && cells.none? { |cell| cell.value.nil? }
  end

end
