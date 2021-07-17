require "pry"

require 'rspec'
require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/player'
require './lib/computer'


describe "Computer" do
  before(:each) do
    @board = Board.new
    @new_computer = Computer.new(@board)
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new('Submarine', 2)
  end

  it 'exists' do

    expect(@new_computer).to be_a(Computer)

  end

  it "can place ships randomly" do
    coordinates = @new_computer.random_selection(@cruiser)

    expect(@new_computer.board.valid_placement?(@cruiser, coordinates)).to eq(true)

    coordinates_2 = @new_computer.random_selection(@submarine)

    expect(@new_computer.board.valid_placement?(@submarine, coordinates_2)).to eq(true)

  end

end
