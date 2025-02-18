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
    arr = (0..5).to_a.sample(4)

    pegs = [@pegs0, @pegs1, @pegs2, @pegs3, @pegs4, @pegs5]

    arr.map { |peg| pegs[peg] || 'No color found' }
  end
end
