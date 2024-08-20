class Robot
  attr_reader :coordinates

  VALID_DIRECTIONS = %i[north east south west].freeze

  ##
  # orient - orients the robot in a given direction
  # @param [Symbol] direction - the direction to orient the Robot
  # @return [nil]
  def orient(direction)
    raise ArgumentError unless VALID_DIRECTIONS.include?(direction)

    @direction_index = VALID_DIRECTIONS.index(direction)
  end

  ##
  # bearing - returns the current bearing of the Robot
  # @return [Symbol] - the current bearing of the Robot
  def bearing
    VALID_DIRECTIONS[@direction_index]
  end

  ##
  # turn_right - turns the robot to the right
  # @return [nil]
  def turn_right
    @direction_index += 1
    @direction_index %= 4
  end

  ##
  # turn_left - turns the robot to the left
  # @return [nil]
  def turn_left
    @direction_index -= 1
    @direction_index %= 4
  end

  ##
  # at - places the robot at a given position
  # @param [Integer] x - the x coordinate
  # @param [Integer] y - the y coordinate
  # @return [nil]
  def at(x, y)
    @coordinates = [x, y]
  end

  ##
  # advance - moves the robot forward
  # @return [nil]
  def advance
    x, y = @coordinates

    case bearing
    when :north
      @coordinates = [x, y + 1]
    when :east
      @coordinates = [x + 1, y]
    when :south
      @coordinates = [x, y - 1]
    when :west
      @coordinates = [x - 1, y]
    end
  end
end

class Simulator
  INSTRUCTION_CODES = {
    "L" => :turn_left,
    "R" => :turn_right,
    "A" => :advance
  }.freeze

  ##
  # instructions takes string command, and parses it into
  # instructions for the robot
  # @param [String] code - the code to be parsed
  # @return [Array<Symbol>] - the instructions for the robot
  def instructions(code)
    commands = code.split("")
    commands.map { |c| INSTRUCTION_CODES[c] }
  end

  ##
  # place - places a robot at a given postion, facing a given direction
  # @param [Robot] robot - the robot to place
  # @param [Integer] x - the x coordintate
  # @param [Integer] y - the y coordintate
  # @param [Symbol] direction - the direction to orient the robot
  # @return [nil]
  def place(robot, x:, y:, direction:)
    robot.at(x, y)
    robot.orient(direction)
  end

  ##
  # evaluate - evaluates a code string on a Robot
  # @param [Robot] robot - the robot to evaluate the code on
  # @param [String] code - the code to evaluate
  # @return [nil]
  def evaluate(robot, code)
    instructions(code).each { |instruction| robot.public_send(instruction) }
  end
end
