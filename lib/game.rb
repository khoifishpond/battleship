class Game
  attr_reader :welcome_message

  def initialize
    @welcome_message = "Welcome to BATTLESHIP\nEnter p to play. Enter q to quit."
  end

  def main_menu
    @welcome_message
  end
end