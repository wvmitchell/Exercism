# typed: true
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../resistor_color_trio'

class ResistorColorTrioTest < Minitest::Test
  def test_orange_and_orange_and_black
    assert_equal 'Resistor value: 33 ohms', ResistorColorTrio.new(%w[orange orange black]).label
  end

  def test_blue_and_grey_and_brown
    assert_equal 'Resistor value: 680 ohms', ResistorColorTrio.new(%w[blue grey brown]).label
  end

  def test_red_and_black_and_red
    assert_equal 'Resistor value: 2 kiloohms', ResistorColorTrio.new(%w[red black red]).label
  end

  def test_green_and_brown_and_orange
    assert_equal 'Resistor value: 51 kiloohms', ResistorColorTrio.new(%w[green brown orange]).label
  end

  def test_yellow_and_violet_and_yellow
    assert_equal 'Resistor value: 470 kiloohms', ResistorColorTrio.new(%w[yellow violet yellow]).label
  end
end
