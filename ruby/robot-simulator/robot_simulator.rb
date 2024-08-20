class Robot
  attr_reader :coordinates

  # @return [Array<Symbol>]
  VALID_DIRECTIONS = %i[north east south west].freeze

  # initialize - initializes a new Robot
  # @param coordinates [Array<Integer, Integer>] the coordinates to place the Robot
  # @return [nil]
  def initialize(coordinates = [0, 0])
    @coordinates = coordinates # @type [Array<Integer, Integer>]
  end

  # orient - orients the robot in a given direction
  # @param direction [Symbol] the direction to orient the Robot
  # @return [Integer]
  def orient(direction)
    raise ArgumentError unless VALID_DIRECTIONS.include?(direction)

    @direction_index = VALID_DIRECTIONS.index(direction)
  end

  # bearing - returns the current bearing of the Robot
  # @return [Symbol] - the current bearing of the Robot
  def bearing
    VALID_DIRECTIONS[@direction_index]
  end

  # turn_right - turns the robot to the right
  # @return [Integer]
  def turn_right
    @direction_index += 1
    @direction_index %= 4
  end

  ##
  # turn_left - turns the robot to the left
  # @return [Integer]
  def turn_left
    @direction_index -= 1
    @direction_index %= 4
  end

  # at - places the robot at a given position
  # @param x [Integer] the x coordinate
  # @param y [Integer] the y coordinate
  # @return [Array<Integer>]
  def at(x, y)
    @coordinates = [x, y]
  end

  # advance - moves the robot forward
  # @return [Array<Integer>]
  def advance
    x = coordinates[0]
    y = coordinates[1]

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

    @coordinates
  end
end

class Simulator
  INSTRUCTION_CODES = {
    "L" => :turn_left,
    "R" => :turn_right,
    "A" => :advance
  }.freeze

  # instructions takes string command, and parses it into
  # instructions for the robot
  # @param code [String] the code to be parsed
  # @return [Array<Symbol>] the instructions for the robot
  def instructions(code)
    commands = code.split("")
    commands.map { |c| INSTRUCTION_CODES[c] }
  end

  # place - places a robot at a given postion, facing a given direction
  # @param robot [Robot] the robot to place
  # @param x [Integer] the x coordintate
  # @param y [Integer] the y coordintate
  # @param direction [Symbol] the direction to orient the robot
  # @return [Integer]
  def place(robot, x:, y:, direction:)
    robot.at(x, y)
    robot.orient(direction)
  end

  # evaluate - evaluates a code string on a Robot
  # @param robot [Robot] the robot to evaluate the code on
  # @param code [String] the code to evaluate
  # @sg-ignore
  # @return [nil]
  def evaluate(robot, code)
    instructions(code).each { |instruction| robot.public_send(instruction) }
  end
end
