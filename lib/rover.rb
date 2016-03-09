require_relative 'position'

class Rover
  attr_reader :position

  def initialize(plateau, x, y, compass)
    self.position = Position.new(plateau, x, y, compass)
  end

  def rotate(direction)
    self.position.rotate(direction)
  end

  def move
    self.position.forward
  end

  def get_position
    position.get_position
  end

  private
  attr_writer :position

end
