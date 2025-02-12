# create a board for mastermind game

require 'colorize'

class Board
  attr_accessor :update_board
  attr_reader :board_array

  def initialize
    @board = [%w[X X X X O O O O]]
    puts 'Welcome to Mastermind'
    @board_array = []
  end

  def update_board(arr)
    puts(arr.map.with_index { |color, ind| @board[0][ind] = color })
    new_board = @board.join(' | ')
    @board_array << new_board
    puts @board_array
  end

  def to_s
    @board.join(' | ')
  end
end

board = Board.new

board.update_board([1, 2, 3, 4])
# newgame.display_board
