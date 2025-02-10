require_relative 'board'
require_relative 'pegs'
require_relative 'player'
require 'colorize'

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

  def start
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

  # l'utilisateur souhaite entrée un couleur et doit pouvoir le faire
  # une fonction user_input(input) input est équivalent à une couleur
  # la fonction user_input permet d'afficher le choix de l'utilisateur
  # au bon endroit.

  def to_s
    "Game avec #{@player.name}
    \n le plateau:\n#{@board}"
  end
end

new_game = Game.new

new_game.start
