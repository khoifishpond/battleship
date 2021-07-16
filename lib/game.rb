class Game
  attr_reader :welcome_message, :board

  def initialize(board)
    @welcome_message = "Welcome to BATTLESHIP\nEnter p to play. Enter q to quit."
    @board = board
  end

  def main_menu
    @welcome_message
  end

  def play
    
  end

  def quit
    "GG LOSER"
  end

  def ship_placement(ship)
    
    computer_coords = @board.cells.keys.sample(ship.length)
    
    until true
      until valid_placement?(ship, computer_coords)
        @board.place(ship, computer_coords)
      end
    end

  end

  def computer_fire_at(cell)
    target_practice = @board.cells.keys
    incel = target_practice.sample
    target_practice.delete(incel)
    incel[cell.to_sym].fire_upon
  end
end