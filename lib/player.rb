# Création des joeurs
require_relative 'board'

class Player
  attr_accessor :name, :user_input

  def initialize(name)
    @name = name
    @id = 1
    @pegs0 = Pegs.new('blue')
    @pegs1 = Pegs.new('white')
    @pegs2 = Pegs.new('red')
    @pegs3 = Pegs.new('green')
    @pegs4 = Pegs.new('yellow')
    @pegs5 = Pegs.new('magenta')
  end

  def user_input
    puts 'Entrez vos 4 chiffres de 0 à 5'
    user_input = gets.chomp
    user_input.chars
  end

  def user_choice
    input_arr = user_input.filter_map { |char| char.to_i if /\d/.match?(char) }.compact
    input_arr.map do |peg|
      case peg
      when 0
        @pegs0
      when 1
        @pegs1
      when 2
        @pegs2
      when 3
        @pegs3
      when 4
        @pegs4
      when 5
        @pegs5
      else
        'No color found'
      end
    end
  end

  def to_s
    "Player : #{@name} is in the game"
  end

  # il faut limiter de manière clair le nombre de caractères entrés
end
