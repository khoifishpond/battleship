require 'rspec'
require './lib/game'
require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/computer'

describe Game do
  before(:each) do
    @new_game = Game.new
    @cruiser = Ship.new("Cruiser", 3)
    @sumbarine = Ship.new("Submarine", 2)
  end

  it 'exists' do
    expect(@new_game).to be_a(Game)
  end

  it 'welcomes the user' do
    expect(@new_game.main_menu).to eq("Welcome to BATTLESHIP\nEnter p to play. Enter q to quit.")
  end

  it 'validates input' do
    expect(@new_game.valid_input?(["A1", "F1", "C1"])).to eq(false)
    expect(@new_game.valid_input?(["A1", "B1", "C1"])).to eq(true)
  end
end
