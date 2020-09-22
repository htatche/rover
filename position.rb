class Position
  attr_accessor :x, :y

  def initialize(x = 0, y = 0)
    # raise unless valid_coordinate?(x,y)

    @x, @y = x, y
  end

  def forward(bearing)
    @x += bearing.ahead_x
    @y += bearing.ahead_y
  end

  private

  def valid_coordinate?(x, y)
    x.is_a?(Integer) &&
      x.positive? && y.positive? &&
      x <= plateau.width && y < plateau.height
  end
end
