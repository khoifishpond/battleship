class Player
  attr_reader :all_player_cells, :player_board, :computer_board

  def initialize(player_board, computer_board)
    @player_board = player_board
    @computer_board = computer_board
    @all_player_cells = @player_board.cells.keys
  end

  def fire_at(cell)
    @computer_board.cells[cell.to_sym].fire_upon
  end
end
