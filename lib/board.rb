# create a board for mastermind game

require 'colorize'

class Board
  attr_accessor :update_board

  def initialize
    @board = [%w[X X X X O O O O]]
    puts 'Welcome to Mastermind'
  end

  def update_board(arr)
    arr.map.with_index { |color, ind| @board[0][ind] = color }
    puts @board.join(' | ')
  end

  def to_s
    @board.join(' | ')
  end
end

# newgame.display_board
