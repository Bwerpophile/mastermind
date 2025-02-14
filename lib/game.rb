require_relative 'board'
require_relative 'pegs'
require_relative 'player'
require_relative 'coder'
require_relative 'pins'
require 'colorize'

# Create the game and rules
class Game
  # attr_accessor :initialize, :start
  attr_reader :board, :compare, :initialize

  def initialize
    @board = Board.new
    @player = Player.new('Joris')
    @coder = Coder.new
    @pins1 = Pins.new('light_red')
    @pins2 = Pins.new('light_blue')
    @game_array = [0, 0, 0, 0]
  end

  def compare(player_code, computer_code)
    @game_array = [0, 0, 0, 0]
    player_code.each_with_index do |element, index|
      if element == computer_code[index]
        @game_array[index] = @pins1.to_s
      elsif computer_code.include?(element)
        @game_array[index] = @pins2
      end
    end
    @game_array
  end

  def start
    computer_code = @coder.random_code
    10.times do
      player_code = @player.user_choice
      feedback = compare(player_code, computer_code)
      @board.update_board(player_code, feedback)
      if player_code == computer_code
        puts 'You win !! '
        break
      end
    end
  end
end

new_game = Game.new

new_game.start
