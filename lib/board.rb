# create a board for mastermind game

require 'colorize'

class Board
  attr_accessor :update_board, :board_array

  def initialize
    @board = [%w[X X X X O O O O]]
    puts 'Welcome to Mastermind'
    @board_array = []
  end

  def update_board(arr)
    arr.map.with_index { |color, ind| @board[0][ind] = color }
    new_board = @board.join(' | ')
    @board_array << new_board
    @board_array
  end

  def to_s
    @board.join(' | ')
  end
end
