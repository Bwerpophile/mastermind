require_relative 'board'
require_relative 'pegs'
require_relative 'player'
require_relative 'coder'
require_relative 'pins'
require_relative 'guesser'
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
    @guesser = Guesser.new
  end

  def compare(player_code, computer_code)
    @game_array = [0, 0, 0, 0]
    player_code.each_with_index do |element, index|
      if element == computer_code[index]
        @game_array[index] = @pins1
      elsif computer_code.include?(element)
        @game_array[index] = @pins2
      end
    end
    @game_array
  end

  def start
    computer_code = @coder.random_code
    guesser_code = @guesser.random_guess # Premier guess aléatoire

    10.times do
      puts "Guess actuel : #{guesser_code.join('|')}"

      feedback = compare(guesser_code, computer_code)
      @board.update_board(guesser_code, feedback)

      new_guess = @guesser.smart_guess(guesser_code, feedback) # ← smart_guess met à jour @new_arr
      puts "Nouveau guess après smart_guess : #{@guesser.new_arr.join('|')}"

      if @guesser.new_arr == computer_code
        puts 'You win !!'
        break
      end

      guesser_code = @guesser.new_arr # ← Utiliser le dernier guess calculé
    end
  end
end

new_game = Game.new

new_game.start
