require 'rspec'
require './lib/game'
require './lib/board'
require './lib/ship'
require './lib/cell'

describe Game do
  before(:each) do
    @new_game = Game.new
  end
  
  it 'exists' do
    expect(@new_game).to be_a(Game)
  end

  it 'welcomes the user' do
    expect(@new_game.main_menu).to eq("Welcome to BATTLESHIP\nEnter p to play. Enter q to quit.")
  end
end