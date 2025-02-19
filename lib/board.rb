# create a board for mastermind game

require 'colorize'

class Board
  attr_accessor :update_board, :board_array, :chose_side

  def initialize
    @board = [0, 0, 0, 0]
    puts 'Welcome to Mastermind'
    puts ['0 is blue'.colorize(:blue), '1 is white'.colorize(:white), '2 is red'.colorize(:red),
          '3 is green'.colorize(:green), '4 is yellow'.colorize(:yellow), '5 is blue'.colorize(:magenta)]
    @last_board = []
    puts 'Do you want to play Guesser or Coder ? Answer g for guesser or c for coder '
  end

  def update_board(arr, feedback)
    @board = arr.map.with_index { |color, ind| @board[ind] = color }
    board_row = @board + feedback
    @last_board << board_row.join(' | ')
    puts @last_board
  end

  def chose_side
    user_side = gets.chomp
    user_side = gets.chomp while valid_side?(user_side) == false
    user_side
  end

  def valid_side?(chose_side)
    if chose_side.length > 1
      puts 'This is not a valid answer, try again'
      false
    elsif chose_side.length < 1
      puts 'This is not a valid answer, write something'
    elsif chose_side.length == 1 && %w[g c].include?(chose_side)
      true
    else
      puts 'This is not a valid answer'
      false
    end
  end

  def to_s
    @board.join(' | ')
  end
end
