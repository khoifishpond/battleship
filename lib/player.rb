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
    @board.cells[cell.to_sym].fire_upon
  end
end