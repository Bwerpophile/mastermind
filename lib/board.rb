# create a board for mastermind game

require 'colorize'

class Board
  attr_accessor :update_board, :board_array

  def initialize
    @board = [0, 0, 0, 0]
    puts 'Welcome to Mastermind'
    puts ['0 is blue'.colorize(:blue), '1 is white'.colorize(:white), '2 is red'.colorize(:red),
          '3 is green'.colorize(:green), '4 is yellow'.colorize(:yellow), '5 is blue'.colorize(:magenta)]
    @last_board = []
  end

  def update_board(arr, feedback)
    @board = arr.map.with_index { |color, ind| @board[ind] = color }
    board_row = @board + feedback
    @last_board << board_row.join(' | ')
    puts @last_board
  end

  def to_s
    @board.join(' | ')
  end
end
