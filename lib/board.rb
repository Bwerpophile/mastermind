# create a board for mastermind game
class Board
  def initialize
    @board = [%w[X X X X O O O O]]
    puts 'Welcome to Mastermind'
  end

  def to_s
    @board.join(' | ')
  end
end

# newgame.display_board
