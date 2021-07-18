class Game
  attr_reader :welcome_message,
              :board,
              :computer,
              :player,
              :computer_board,
              :player_board,
              :computer_cruiser,
              :computer_submarine,
              :player_cruiser,
              :player_submarine,
              :all_comp_ships

  def initialize
    @welcome_message = "Welcome to BATTLESHIP\nEnter p to play. Enter q to quit."
    @computer_board = Board.new
    @player_board = Board.new
    @computer = Computer.new(@player_board, @computer_board)
    @player = Player.new(@player_board, @computer_board)

    # gave each player their own set of ships
    @player_cruiser = Ship.new("Cruiser", 3)
    @player_submarine = Ship.new("Submarine", 2)
    @computer_cruiser = Ship.new("Cruiser", 3)
    @computer_submarine = Ship.new("Submarine", 2)

    # may not need this? makes automation for computer placement easier though
    @all_comp_ships = [@computer_cruiser, @computer_submarine]
  end

  def main_menu
    puts @welcome_message
  end

  # moved player selection stuff to game class
  def user_input
    gets.chomp
  end

  def player_message
    # displays only once. ONE AND DONEEEEE
    puts "I have laid out my ships on the grid.\n" +
         "You now need to lay out your two ships.\n" +
         "The Cruiser is three units long and the Submarine is two units long.\n" +
         "\n  1 2 3 4 \n" +
         "A . . . . \n" +
         "B . . . . \n" +
         "C . . . . \n" +
         "D . . . . \n" +
         "Enter the squares for the Cruiser (3 spaces): "
  end

  def player_cruiser_placement(player_cruiser)
    input = user_input.upcase.split

    until @player_board.valid_placement?(player_cruiser, input) do
      puts "Invalid coordinates. Please try again: "
      input = user_input.upcase.split
    end

    if @player_board.valid_placement?(player_cruiser, input) # && a;sdfj;aldjf;lasjd;flajsdf;lasdfjal;sd;ajf
      @player_board.place(player_cruiser, input)
      @player_board.render(true)
    end
  end

  def player_submarine_placement(player_submarine)
    puts "\nEnter the squares for the Submarine (2 spaces): "
    input = user_input.upcase.split

    until @player_board.valid_placement?(player_submarine, input) do
      puts "\nInvalid coordinates. Please try again: "
      input = user_input.upcase.split
    end

    if @player_board.valid_placement?(player_submarine, input)
      @player_board.place(player_submarine, input)
      @player_board.render(true)
    end
  end

  def display_boards
    puts "=============COMPUTER BOARD============="
    @computer_board.render
    puts "==============PLAYER BOARD=============="
    @player_board.render(true)
  end

  def player_shot
    puts "\nSelect a coordinate to fire at your opponent: "
    input = user_input

    until @computer_board.valid_coordinate?(input.upcase) do
      puts "\nPlease enter a valid coordinate. Try again: "
      input = user_input
    end

    if @computer_board.valid_coordinate?(input.upcase) && @computer_board.cells[input.upcase.to_sym].fired_upon?
      puts "\nCell has already been fired upon. You wasted a turn."
    else
      @player.fire_at(input.upcase)

      if @computer_board.cells[input.upcase.to_sym].render == 'X'
        puts "\nYour shot on #{input.upcase} was a hit! You sunk my battleship!"
      elsif @computer_board.cells[input.upcase.to_sym].render == "H"
        puts "\nYour shot on #{input.upcase} was a hit!"
      else
        puts "\nYour shot on #{input.upcase} was a miss. LOLOLOL!"
      end
    end
  end

  def computer_shot
    target = @computer.computer_fire_at
    if @player_board.cells[target].render == 'X'
      puts "\nMy shot on #{@player_board.cells[target].coordinate} was a hit! Baiiiiii."
    elsif @player_board.cells[target].render == 'H'
      puts "\nMy shot on #{@player_board.cells[target].coordinate} was a hit!"
    else
      puts "\nMy shot on #{@player_board.cells[target].coordinate} was a miss..."
    end
  end

  def turn
    until game_over? do
      player_shot
      display_boards
      if game_over? && player_wins
        display_boards
        puts "\nCongrats... You won."
        break
      end

      computer_shot
      display_boards
      if game_over? && computer_wins
        display_boards
        puts "\nHA! I won!"
        break
      end
    end
  end

  def play
    # computer automatically places ships on board at start of play
    @all_comp_ships.each do |ship|
      @computer_board.place(ship, @computer.random_selection(ship))
    end
    
    # then player places ships
    player_message
    player_cruiser_placement(@player_cruiser)
    player_submarine_placement(@player_submarine)
    puts "\nLET'S GO!"
    display_boards
    turn
  end

  def quit
    puts "\nGG (I guess)."
  end

  def player_wins
    @computer_cruiser.health == 0 && @computer_submarine.health == 0
  end

  def computer_wins
    @player_cruiser.health == 0 && @player_submarine.health == 0
  end

  def game_over?
    player_wins || computer_wins
  end

  def start
    main_menu
    input = user_input.downcase

    if input == 'p'
      play
    elsif input == 'q'
      quit
    end
  end
end


  # def valid_input?(coordinates)
  #   coordinates.all? do |cell|
  #     @player_board.valid_coordinate?(cell)
  #   end
  # end

  # def place_your_ships
  #   @player_board.render(true)

  #   @all_ships.each do |ship|
  #     "Enter the squares for the #{ship.name} (#{ship.length} spaces):"
  #     input = @player.select_coordinates
  #   end
    
    # until @all_ships.size == 0
    #   @all_ships.each do |ship|
    #     "Enter the squares for the #{ship.name} (#{ship.length} spaces):"
    #     coordinates = @player.select_coordinates
    #     if valid_input?(coordinates)
    #       @player_board.place(ship, coordinates)
    #       @all_ships.shift
    #     else
    #       'Those are invalid coordinates. Please try again:'
    #     end
    #   end
    # end
  # end