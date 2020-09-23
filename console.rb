require_relative 'plateau'
require_relative 'rover'

class Console
  MOVE = 'M'.freeze
  LEFT = 'L'.freeze
  RIGHT = 'R'.freeze

  def read
    rovers = []
    plateau = create_plateau(gets.chomp)

    loop do
      input = gets.chomp

      break if input == 'END'

      rovers << send_rover(plateau, input)

      input = gets.chomp

      instruct_rover(rovers.last, input)
    end
  end

  private

  def create_plateau(input)
    width, length = *input.split(' ').map(&:to_i)

    Plateau.new(width, length)
  end

  def send_rover(plateau, input)
    x, y, bearing = *input.split(' ')

    Rover.new(plateau, x.to_i, y.to_i, bearing)
  end

  def instruct_rover(rover, input)
    commands = input.split('')

    commands.each do |command|
      raise 'Invalid command' unless [MOVE, LEFT, RIGHT].include?(command)

      command_rover(rover, command)
    end

    puts "#{rover.position.x} #{rover.position.y} #{rover.bearing.label}"
  end

  def command_rover(rover, command)
    rover.rotate(:left) if command == LEFT
    rover.rotate(:right) if command == RIGHT
    rover.move if command == MOVE
  end
end
