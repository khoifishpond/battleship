class Game
  attr_reader :welcome_message, :board, :computer, :player

  def initialize
    @welcome_message = "Welcome to BATTLESHIP\nEnter p to play. Enter q to quit."
    @computer_board = Board.new
    @player_board = Board.new
    # @player = player
    # @computer = computer
    # require "pry";binding.pry
  end

  def main_menu
    @welcome_message
  end

  def play

  end

  def quit
    "GG LOSER"
  end




end
