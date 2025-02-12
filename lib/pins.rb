# create pins to give information about the code to find
require 'colorize'

class Pins
  def initialize(color_name)
    @color = color_name.to_sym
  end

  def to_s
    'X'.colorize(@color)
  end
end

pin = Pins.new('red')
puts pin # Ça doit afficher "X" en rouge
