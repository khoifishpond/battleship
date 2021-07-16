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
  end

  it 'exists' do

    expect(@new_computer).to be_a(Computer)

    expect(@new_computer.random_selection).to be_a(Cell)
  end

  it "" do

  end
end
