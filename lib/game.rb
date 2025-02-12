require_relative 'board'
require_relative 'pegs'
require_relative 'player'
require 'colorize'
require_relative 'coder'

# Create the game and rules
class Game
  attr_accessor :initialize, :start

  def initialize
    @board = Board.new
    @player = Player.new('Joris')
    @pegs1 = Pegs.new('blue')
    @pegs2 = Pegs.new('white')
    @pegs3 = Pegs.new('red')
    @pegs4 = Pegs.new('green')
    @pegs5 = Pegs.new('yellow')
    @pegs6 = Pegs.new('magenta')
  end

  def user_choice
    input_arr = @player.user_input.filter_map { |char| char.to_i if /\d/.match?(char) }.compact
    new_arr = input_arr.map do |peg|
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
    @board.update_board(new_arr)
  end

  def compare
  end

  def start
    user_choice while @board.board_array.length < 10
  end

  def to_s
    "Game avec #{@player.name}
    \n le plateau:\n#{@board}"
  end
end

new_game = Game.new

new_game.start
