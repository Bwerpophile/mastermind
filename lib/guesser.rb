class Guesser
  attr_reader :new_arr

  def initialize
    @pegs0 = Pegs.new('blue')
    @pegs1 = Pegs.new('white')
    @pegs2 = Pegs.new('red')
    @pegs3 = Pegs.new('green')
    @pegs4 = Pegs.new('yellow')
    @pegs5 = Pegs.new('magenta')
    @pins1 = Pins.new('light_red')
    @pins2 = Pins.new('light_blue')
    @first_guess = []
    @new_guess = [0, 0, 0, 0]
    @colors_used = []
    @new_arr = [0, 0, 0, 0]
    @sample_pegs = []
    @color_remaining = []
    @eliminated_pegs = []
  end

  def random_guess
    arr = (0..5).to_a.sample(4)

    pegs = [@pegs0, @pegs1, @pegs2, @pegs3, @pegs4, @pegs5]

    first_guess = arr.map { |peg| pegs[peg] || 'No color found' }
    @first_guess = [@pegs0, @pegs0, @pegs0, @pegs0]
  end

  def sample(nbr)
    arr = (0..5).to_a.sample(nbr)

    pegs = [@pegs0, @pegs1, @pegs2, @pegs3, @pegs4, @pegs5]
    @sample_pegs = arr.map { |peg| pegs[peg] || 'No color found' }
    @sample_pegs
  end

  def compare(player_code, computer_code)
    @game_array = [0, 0, 0, 0]
    temp_code = computer_code.dup # On crée une copie pour éviter les erreurs de comptage

    # Étape 1 : Assigner les `light_red`
    player_code.each_with_index do |element, index|
      if element == temp_code[index]
        @game_array[index] = @pins1 # light_red
        temp_code[index] = nil # On "bloque" cette case pour éviter qu'elle ne soit réutilisée
      end
    end

    # Étape 2 : Assigner les `light_blue`
    player_code.each_with_index do |element, index|
      next if @game_array[index] == @pins1 # On ignore les `light_red` déjà trouvés

      if temp_code.include?(element)
        @game_array[index] = @pins2 # light_blue
        temp_code[temp_code.index(element)] = nil # Supprime cet élément de temp_code
      end
    end

    @game_array
  end

  def smart_guess(guesser_code, feedback)
    fixed_positions = {} # Stocke les positions des light_red
    new_guess = Array.new(4, nil) # Initialise un nouvel array de taille 4

    pegs = [@pegs0, @pegs1, @pegs2, @pegs3, @pegs4, @pegs5]

    # Étape 1 : Analyser le feedback
    # Étape 1 : Analyser le feedback
    # Étape 1 : Analyser le feedback
    feedback.each_with_index do |element, index|
      if element == 0
        unless @eliminated_pegs.any? { |peg| peg.color == guesser_code[index].color }
          @eliminated_pegs << guesser_code[index]
        end
        next # On passe à l'élément suivant après l'avoir ajouté aux éliminés
      end

      next unless element.is_a?(Pins) # On continue seulement si c'est un Pins

      # Vérification et ajout pour la couleur light_red
      if element.color == :light_red
        @colors_used << guesser_code[index] unless @colors_used.any? { |peg| peg.color == guesser_code[index].color }
        fixed_positions[index] = guesser_code[index] # Fixer l'élément à sa position
        new_guess[index] = guesser_code[index]

      # Vérification et ajout pour la couleur light_blue
      elsif element.color == :light_blue
        @color_remaining << guesser_code[index] unless @color_remaining.any? do |peg|
          peg.color == guesser_code[index].color
        end
      end
    end

    # Étape 2 : Filtrer les couleurs éliminées
    # Les couleurs restantes pour le remplissage doivent être celles qui ne sont pas éliminées
    puts 'This colorsuseed'
    puts @colors_used

    puts 'This REMANING'
    puts @color_remaining

    remaining_pegs = pegs.reject { |peg| @eliminated_pegs.any? { |elim| elim.color == peg.color } }

    puts 'This REMAINING'
    puts remaining_pegs

    puts '#ELIMINATED_PEGS'
    puts @eliminated_pegs

    # Étape 3 : Remplir les cases restantes avec les couleurs disponibles
    available_positions = (0..3).to_a - fixed_positions.keys # Trouver les cases libres
    available_positions.each do |pos|
      # Ne remplir que les cases libres et non déjà utilisées
      new_guess[pos] = remaining_pegs.sample unless remaining_pegs.empty?
      # @colors_used << available_peg # Marquer la couleur utilisée
    end

    @new_arr = new_guess # Mettre à jour @new_arr
    puts 'NEW GUESS'
    puts @new_arr.join('|')
    puts '_______'
    @new_arr
  end
end
