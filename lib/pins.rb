# create pins to give information about the code to find
class Pins
  def initialize(color_name)
    @color = color_name.colorize(color_name.to_sym)
  end

  def to_s
    @color
  end
end
