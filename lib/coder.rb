# require files
require_relative 'pegs'

# generate the code to find
class Coder
  def initialize
    @pegs1 = Pegs.new('blue')
    @pegs2 = Pegs.new('white')
    @pegs3 = Pegs.new('red')
    @pegs4 = Pegs.new('green')
    @pegs5 = Pegs.new('yellow')
    @pegs6 = Pegs.new('magenta')
  end

  def random_code
    arr = [0, 1, 2, 3, 4, 5].sample(4)

    code = arr.map do |peg|
      case peg
      when 0
        @pegs1
      when 1
        @pegs2
      when 2
        @pegs3
      when 3
        @pegs4
      when 4
        @pegs5
      when 5
        @pegs6
      else
        'No color found'
      end
    end
    puts code
  end
end

coder = Coder.new
coder.random_code
