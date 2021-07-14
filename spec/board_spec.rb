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
    expect(@board.cells).to eq({
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
    })
  end

  # is this coordinate or cell valid?
  xit '' do
    # TODO: expectation here
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