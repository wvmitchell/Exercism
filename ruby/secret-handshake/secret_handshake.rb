class SecretHandshake
  # @!attribute [r] commands
  #   @return [Array<String>] the commands that make up the handshake
  attr_reader :commands

  # The possible commands in a secret_handshake
  # @return [Hash<Integer, String>]
  POSSIBLE_COMMANDS = {
    1 => "wink",
    2 => "double blink",
    4 => "close your eyes",
    8 => "jump"
  }.freeze

  # The code causing the handshake to be reversed
  # @return [Integer]
  REVERSE_COMMAND = 16

  # initialize a new SecretHandshake
  # @param code [Integer] the code to be used to generate the handshake
  # @return [NilClass]
  def initialize(code)
    code = code.is_a?(Integer) ? code : 0
    @commands = parse_code(code)
  end

  # parse_code takes an integer code and does bitwise comparisons
  # to determine the corrrect commands
  # @param code [Integer] the code to be used to generate the handshake
  # @return [Array<String>] the commands that make up the handshake
  def parse_code(code)
    list =
      POSSIBLE_COMMANDS
      .map { |int, command| (code & int).positive? ? command : nil }
      .compact
    (code & REVERSE_COMMAND).positive? ? list.reverse : list
  end
end
