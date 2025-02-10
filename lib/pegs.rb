# create the pegs
require 'colorize'

class Pegs
  attr_accessor :color, :position

  def initialize
    @color = %w[blue orange red green yellow magenta]
    @position = nil
  end

  def pegs_position(position)
    @position = position
  end

  def blue
    @color = @color[0].colorize(:blue)
  end

  def white
    @color = @color[1].colorize(:white)
  end

  def red
    @color = @color[2].colorize(:red)
  end

  def green
    @color = @color[3].colorize(:green)
  end

  def yellow
    @color = @color[4].colorize(:yellow)
  end

  def magenta
    @color = @color[5].colorize(:magenta)
  end
end

pegs1 = Pegs.new
pegs2 = Pegs.new
pegs3 = Pegs.new
pegs4 = Pegs.new
pegs5 = Pegs.new
pegs6 = Pegs.new

puts pegs1.blue
puts pegs2.white
puts pegs3.green
puts pegs4.red
puts pegs5.yellow
puts pegs6.magenta
