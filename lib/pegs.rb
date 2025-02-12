# create the pegs
require 'colorize'

class Pegs
  attr_accessor :color, :position

  def initialize(color_name)
    @color = color_name.colorize(color_name.to_sym)
  end

  def to_s
    @color
  end

  def ==(other)
    other.is_a?(Pegs) && color == other.color
  end
end
