# Création des joeurs

class Player
  attr_accessor :name

  def initialize(name)
    @name = name
    @id = 1
  end

  def to_s
    "Player : #{@name} is in the game"
  end

  def user_input
    puts 'Entrez vos 4 chiffres'

    input_arr = []
    user_input = gets.chomp
    input_arr = user_input.chars
    p input_arr
  end
end
