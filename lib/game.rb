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

  def rematch_valid?(user_rematch)
    if user_rematch.length > 1
      puts 'This is not a valid answer, try again'
      false
    elsif user_rematch.length < 1
      puts 'This is not a valid answer, write something'
    elsif user_rematch.length == 1 && %w[y n].include?(user_rematch)
      true
    else
      puts 'This is not a valid answer'
      false
    end
  end

  def rematch
    user_rematch = gets.chomp.downcase
    rematch_valid?(user_rematch)
    until rematch_valid?(user_rematch)
      puts 'Invalid input, please enter y or n'
      user_rematch = gets.chomp.downcase
    end
    if user_rematch == 'y'
      Game.new.start
    elsif user_rematch == 'n'
      puts 'bybye'
    end
  end

  def start
    chose_side = @board.chose_side
    if chose_side == 'g'
      puts 'You choose GUESSER'
      computer_code = @coder.random_code
      10.times do
        player_code = @player.user_choice
        feedback = compare(player_code, computer_code)
        @board.update_board(player_code, feedback)
        next unless player_code == computer_code

        puts 'You win !!'

        break
      end

    elsif chose_side == 'c'
      puts 'You choose CODER'

      computer_code = @player.user_choice
      guesser_code = @guesser.random_guess
      10.times do
        puts "Guess actuel : #{guesser_code.join('|')}"

        feedback = compare(guesser_code, computer_code)
        @board.update_board(guesser_code, feedback)

        new_guess = @guesser.smart_guess(guesser_code, feedback)
        if @guesser.new_arr == computer_code
          puts 'COMPUTER WIN !!'
          puts "#LAST CODE : #{new_guess.join('|')}"
          break
        end

        guesser_code = @guesser.new_arr # ← Utiliser le dernier guess calculé
      end

      puts
      puts "#CODER CODE : #{computer_code.join('|')}"
    end

    puts 'Enter Y to replay or N to quit'
    rematch
  end
end

new_game = Game.new

new_game.start
