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
end
