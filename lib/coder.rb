# require files
require_relative 'pegs'

# generate the code to find
class Coder
  attr_reader :random_code

  def initialize
    @pegs0 = Pegs.new('blue')
    @pegs1 = Pegs.new('white')
    @pegs2 = Pegs.new('red')
    @pegs3 = Pegs.new('green')
    @pegs4 = Pegs.new('yellow')
    @pegs5 = Pegs.new('magenta')
  end

  def random_code
    arr = [0, 1, 2, 3, 4, 5].sample(4)

    test = arr.map do |peg|
      case peg
      when 0
        @pegs0
      when 1
        @pegs1
      when 2
        @pegs2
      when 3
        @pegs3
      when 4
        @pegs4
      when 5
        @pegs5
      else
        'No color found'
      end
    end
  end
end
