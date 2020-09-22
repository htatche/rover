class Bearing
  BEARINGS = {
    'N' => { x: 0, y: 1 },
    'E' => { x: 1, y: 0 },
    'S' => { x: 0, y: -1 },
    'W' => { x: -1, y: 0 }
  }.freeze

  attr_accessor :bearing

  def initialize(bearing)
    @bearing = BEARINGS.fetch(bearing)
  end

  def rotate(direction)
    @bearing = direction == :left ? rotate_left : rotate_right
  end

  def ahead_x
    bearing.fetch(:x)
  end

  def ahead_y
    bearing.fetch(:y)
  end

  private

  def rotate_left
    return BEARINGS.last if bearing == BEARINGS.first

    BEARINGS.values[bearing_index - 1]
  end

  def rotate_right
    return BEARINGS.first if bearing == BEARINGS.last

    BEARINGS.values[bearing_index + 1]
  end

  def bearing_index
    BEARINGS.values.find_index { |i| i == bearing }
  end
end
