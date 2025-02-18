# require colorize
require 'colorize'

# create pins to give information about the code to find
class Pins
  attr_reader :color

  def initialize(color_name)
    @color = color_name.to_sym
  end

  def to_s
    'X'.colorize(@color)
  end
end

pins = Pins.new('blue')
p pins.color
