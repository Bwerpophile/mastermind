require_relative 'board'
require_relative 'pegs'
require_relative 'player'

# Create the game and rules
class Game
  def initialize
    @board = Board.new
    @player = Player.new('Joris')
    @pegs1 = Pegs.new
    @pegs2 = Pegs.new
    @pegs3 = Pegs.new
    @pegs4 = Pegs.new
    @pegs5 = Pegs.new
    @pegs6 = Pegs.new
  end

  def start
    @player.user_input
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
