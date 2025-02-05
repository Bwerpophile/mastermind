# create the pegs
class Pegs
  attr_accessor :color, :position

  def initialize(color, position)
    @color = color
    @position = nil
  end

  def pegs_position(position)
    @position = position
  end
end
