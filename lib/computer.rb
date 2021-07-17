require './lib/player'

class Computer < Player

  def random_selection(ship)
    all_positions_possible = []
    rows_columns = ["A", "B", "C", "D", "1", "2", "3", "4"]
    rows_columns.each do |line|
      @board.cells.keys.select do |key|
        if key[0] == line || key[1] == line
          all_positions_possible << key
        end
      end
    end

    new_array = all_positions_possible.each_cons(ship.length).to_a

    final_array = new_array.find_all do |keys|
        @board.consecutive?(keys)
    end

    final_array.sample
  end

  def computer_fire_at(cell)
    all_cells = @board.cells.keys
    random_cell_selection = target_practice.sample
    all_cells.delete(random_cell_selection)
    random_cell_selection[cell.to_sym].fire_upon
  end

end
