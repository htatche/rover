require_relative 'position.rb'
require_relative 'bearing.rb'

class Rover
  attr_accessor :position, :bearing

  def initialize(x, y, bearing)
    @position = Position.new(x, y)
    @bearing = Bearing.new(bearing)
  end

  def rotate(direction)
    raise unless [:left, :right].include?(direction)

    bearing.rotate(direction)
  end

  def move
    position.forward(bearing)
  end
end
