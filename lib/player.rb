# Création des joeurs

class Player
  attr_accessor :name, :user_input

  def initialize(name)
    @name = name
    @id = 1
  end

  def to_s
    "Player : #{@name} is in the game"
  end

  # il faut limiter de manière clair le nombre de caractères entrés
  def user_input
    puts 'Entrez vos 4 chiffres de 0 à 5'
    user_input = gets.chomp
    user_input.chars
  end
end
