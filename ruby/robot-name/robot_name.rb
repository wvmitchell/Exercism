class Robot
  @last_serial_number = nil
  attr_reader :name

  LETTERS = ("A".."Z").to_a
  SERIAL_NUMBERS = 26 * 26 * 1000

  def initialize
    @name = self.class.new_name
  end

  def reset
    @name = self.class.new_name
  end

  def self.new_name
    if @last_serial_number.nil?
      @serial_number = 0
    else
      @serial_number += 1
    end
    @last_serial_number = @serial_number

    rest, num = @serial_number.divmod(1000)
    rest, l1 = rest.divmod(26)
    l2 = rest % 26

    LETTERS[l2] + LETTERS[l1] + format("%03d", num)
  end

  def self.forget
    @last_serial_number = nil
  end
end
