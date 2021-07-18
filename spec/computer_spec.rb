require "pry"

require 'rspec'
require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/player'
require './lib/computer'


describe "Computer" do
  before(:each) do
    @player_board = Board.new
    @computer_board = Board.new
    @new_computer = Computer.new(@player_board, @computer_board)
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new('Submarine', 2)
  end

  it 'exists' do
    expect(@new_computer).to be_a(Computer)
  end

  it "can place ships randomly" do
    coordinates_1 = @new_computer.random_selection(@cruiser)

    expect(@new_computer.computer_board.valid_placement?(@cruiser, coordinates_1)).to eq(true)

    coordinates_2 = @new_computer.random_selection(@submarine)

    expect(@new_computer.computer_board.valid_placement?(@submarine, coordinates_2)).to eq(true)
  end

  it 'can fire at cell' do
    expect(@new_computer.computer_fire_at).to be_a(Symbol)
  end
end
