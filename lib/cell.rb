class Cell

  attr_accessor :value

  def initialize(value = nil)
    @value = value
  end

  def x?
    self.value == 1
  end

  def o?
    self.value == 0
  end

  def empty?
    self.value.nil?
  end
end