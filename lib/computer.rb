require './lib/player'

class Computer < Player
  # attr_reader :player_board, :computer_board

  # def initialize(player_board, computer_board)
  #   @player_board = player_board
  #   @computer_board = computer_board
  # end

  def random_selection(ship)
    all_positions_possible = []
    rows_columns = ["A", "B", "C", "D", "1", "2", "3", "4"]

    rows_columns.each do |line|
      @computer_board.cells.keys.select do |key|
        if key[0] == line || key[1] == line
          all_positions_possible << key
        end
      end
    end

    new_array = all_positions_possible.each_cons(ship.length).to_a

    final_array = new_array.find_all do |keys|
      @computer_board.consecutive?(keys)
    end

    final_array.sample
  end

  def computer_fire_at
    all_cells = @player_board.cells.keys
    random_cell_selection = all_cells.sample
    all_cells.delete(random_cell_selection)
    @player_board.cells[random_cell_selection].fire_upon
    random_cell_selection
  end
end
