class Player
  attr_reader :coordinates, :player_board, :computer_board

  def initialize(player_board, computer_board)
    @coordinates = []
    @player_board = player_board
    @computer_board = computer_board
  end

  def select_coordinates(input)
    @coordinates << input
    @coordinates.flatten
  end

  def fire_at(cell)
    @board.cell_selection(cell).fire_upon
  end

end
