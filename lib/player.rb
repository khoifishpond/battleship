class Player
  attr_reader :coordinates, :player_board, :computer_board

  def initialize(player_board, computer_board)
    @player_board = player_board
    @computer_board = computer_board
  end

  # def select_coordinates
  #   input = gets.chomp
  #   input.upcase.split
  # end

  def fire_at(cell)
    # require 'pry'; binding.pry
    @computer_board.cells[cell.to_sym].fire_upon
  end
end
