class Position
  attr_accessor :x, :y

  def initialize(plateau, x = 0, y = 0)
    @x = x
    @y = y
    @plateau = plateau

    raise ArgumentError, 'Invalid coordinates' unless valid_coordinate?
  end

  def forward(bearing)
    return unless within_limits?(
      x = @x + bearing.ahead_x,
      y = @y + bearing.ahead_y
    )

    @x = x
    @y = y
  end

  private

  def valid_coordinate?
    [@x, @y].all?(Integer) && within_limits?(@x, @y)
  end

  def within_limits?(x, y)
    (0..@plateau.length).include?(x) && (0..@plateau.width).include?(y)
  end
end
