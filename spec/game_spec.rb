require 'rspec'
require './lib/game'
require './lib/board'
require './lib/ship'
require './lib/cell'

describe Game do
  before(:each) do
    @board = Board.new
    @new_game = Game.new(@board)
    @cruiser = Ship.new("Cruiser", 3)
    @sumbarine = Ship.new("Submarine", 2)
  end
  
  it 'exists' do
    expect(@new_game).to be_a(Game)
  end

  it 'welcomes the user' do
    expect(@new_game.main_menu).to eq("Welcome to BATTLESHIP\nEnter p to play. Enter q to quit.")
  end

  xit 'works' do
    expect(@new_game.ship_placement(@cruiser)).to eq(true)
  end

  it 'can fire upon' do
    @new_game.computer_fire_at("A1")

    expect(@board.cells["A1"].is_fired_upon).to eq(true)
  end
end