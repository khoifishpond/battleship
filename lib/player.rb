class Player
  attr_reader :coordinates, :board

  def initialize(board)
    @coordinates = []
    @board = board
  end

  def select_coordinates(input)
    @coordinates << input
    @coordinates.flatten
  end

  def fire_at(cell)
    @board.cell_selection(cell).fire_upon
  end
end
