class Plateau
  attr_accessor :width, :length

  def initialize(width = 10, length = 10)
    raise ArgumentError, 'Invalid dimensions' unless valid_area?(width, length)

    @width = width
    @length = length
  end

  private

  def valid_area?(width, length)
    [width, length].all? { |i| i.is_a?(Integer) && i.positive? }
  end
end
