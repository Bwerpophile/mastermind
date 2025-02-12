require_relative 'board'
require_relative 'pegs'
require_relative 'player'
require_relative 'coder'
require_relative 'pins'
require 'colorize'

# Create the game and rules
class Game
  attr_accessor :initialize, :start
  attr_reader :board

  def initialize
    @board = Board.new
    @player = Player.new('Joris')
    @coder = Coder.new
    @pins1 = Pins.new('light_red')
    @pins2 = Pins.new('light_blue')
    @game_array = [0, 0, 0, 0]
  end

  def compare(arr1, arr2)
    # puts "this is the board #{@board.board_array[5]}"
    board_row = @board.board_array.last.split(' | ')
    arr1.each_with_index do |element, index|
      if element == arr2[index]
        @game_array[index] = element
        board_row[index + 4] = @pins1.to_s # to_s car c'est un objet et sinon le code casse avec l'utilisation de #las
      elsif arr2.include?(element)
        board_row[index + 4] = @pins2.to_s
      end
    end
    puts @game_array.join(' | ')
    puts board_row.join(' | ')
    @board.board_array = board_row.last.split(' | ')
  end

  def start
    computer_code = @coder.random_code
    while @board.board_array.length < 10
      player_code = @player.user_choice
      @board.update_board(player_code)
      puts 'your close' if compare(player_code, computer_code) == false
      puts 'you win' if player_code == computer_code
    end
  end

  def to_s
    "Game avec #{@player.name}
    \n le plateau:\n#{@board}"
  end
end

new_game = Game.new

new_game.start
