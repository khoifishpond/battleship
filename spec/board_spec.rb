require 'rspec'
require './lib/board'
require './lib/ship'
require './lib/cell'

describe Board do
  before(:each) do
    @board = Board.new
    @cruiser = Ship.new('Cruiser', 3)
    @submarine = Ship.new('Submarine', 2)
  end

  it 'exists' do
    expect(@board).to be_a(Board)
  end

  it 'has cells' do
    expect(@board.cells).to be_a(Hash)
    expect(@board.cells["A1"]).to be_a(Cell)
    expect(@board.cells["D3"]).to be_a(Cell)
  end

  it 'has valid coordinates' do
    expect(@board.valid_coordinate?("A1")).to eq(true)
    expect(@board.valid_coordinate?("D4")).to eq(true)
    expect(@board.valid_coordinate?("A5")).to eq(false)
    expect(@board.valid_coordinate?("E1")).to eq(false)
    expect(@board.valid_coordinate?("A22")).to eq(false)
  end

  # is the ship's placement valid?
  xit '' do
    # TODO: expectation here
  end

  # when placed, are the coordinates consecutive?
  xit '' do
    # TODO: expectation here
  end

  # ships cannot be placed diagonally
  xit '' do
    # TODO: expectation here
  end
end