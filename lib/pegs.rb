# create the pegs
require 'colorize'

class Pegs
  attr_accessor :color, :position

  def initialize(color_name)
    @color = color_name.colorize(color_name.to_sym)
    @position = nil
  end

  def pegs_position(position)
    @position = position
  end

  def to_s
    @color
  end
end
