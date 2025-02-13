# create a board for mastermind game

require 'colorize'

class Board
  attr_accessor :update_board, :board_array

  def initialize
    @board = [%w[X X X X O O O O]]
    puts 'Welcome to Mastermind'
    puts ['0 is blue'.colorize(:blue), '1 is white'.colorize(:white), '2 is red'.colorize(:red),
          '3 is green'.colorize(:green), '4 is yello'.colorize(:yellow), '5 is blue'.colorize(:magenta)]
    @board_array = []
  end

  def update_board(arr)
    arr.map.with_index { |color, ind| @board[0][ind] = color }
    new_board = @board.join(' | ')
    @board_array << new_board
    puts @board_array
  end

  def display_board(arr)
    puts @board_array
  end

  def to_s
    @board.join(' | ')
  end
end
