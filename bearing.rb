class Bearing
  BEARINGS = [
    { label: 'N', x: 0, y: 1 },
    { label: 'E', x: 1, y: 0 },
    { label: 'S', x: 0, y: -1 },
    { label: 'W', x: -1, y: 0 }
  ].freeze

  # attr_accessor :bearing

  def initialize(label)
    @current = BEARINGS.find { |i| i.fetch(:label) == label }

    raise ArgumentError, 'Invalid bearing' unless @current
  end

  def rotate(direction)
    @current = direction == :left ? rotate_left : rotate_right
  end

  def ahead_x
    @current.fetch(:x)
  end

  def ahead_y
    @current.fetch(:y)
  end

  def label
    @current.fetch(:label)
  end

  private

  def rotate_left
    return BEARINGS.last if @current == BEARINGS.first

    BEARINGS[bearing_index - 1]
  end

  def rotate_right
    return BEARINGS.first if @current == BEARINGS.last

    BEARINGS[bearing_index + 1]
  end

  def bearing_index
    BEARINGS.find_index { |i| i == @current }
  end
end
