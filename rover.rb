require_relative 'plateau'
require_relative 'position'
require_relative 'bearing'

class Rover
  DIRECTIONS = %i[left right].freeze

  attr_accessor :position, :bearing

  def initialize(plateau, x = 0, y = 0, bearing = 'N')
    @plateau = plateau
    @position = Position.new(plateau, x, y)
    @bearing = Bearing.new(bearing)
  end

  def rotate(direction)
    raise 'Invalid direction' unless DIRECTIONS.include?(direction)

    bearing.rotate(direction)
  end

  def move
    position.forward(bearing)
  end
end
