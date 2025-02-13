require_relative 'board'
require_relative 'pegs'
require_relative 'player'
require_relative 'coder'
require_relative 'pins'
require 'colorize'

# Create the game and rules
class Game
  # attr_accessor :initialize, :start
  attr_reader :board

  def initialize
    @board = Board.new
    @player = Player.new('Joris')
    @coder = Coder.new
    @pins1 = Pins.new('light_red')
    @pins2 = Pins.new('light_blue')
    @game_array = [0, 0, 0, 0]
    @last_board = []
  end

  def compare(arr1, arr2)
    board_row = @board.board_array.last.split(' | ')
    arr1.each_with_index do |element, index|
      if element == arr2[index]
        @game_array[index] = element
        board_row[index + 4] = @pins1.to_s # to_s car c'est un objet et sinon le code casse avec l'utilisation de #las
      elsif arr2.include?(element)
        board_row[index + 4] = @pins2.to_s
      end
    end
    @last_board << board_row
    puts board_row.join(' | ')
  end

  def start
    computer_code = @coder.random_code
    10.times do
      player_code = @player.user_choice
      @board.update_board(player_code)
      compare(player_code, computer_code)
      if player_code == computer_code
        puts 'You win !! '
        break
      end
    end
  end
end

new_game = Game.new

new_game.start
