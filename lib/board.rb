require_relative "./cell.rb"

class Board

  attr_reader :cells

  def initialize
    @cells = Array.new(9, Cell.new)
  end

end