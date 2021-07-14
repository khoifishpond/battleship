require 'rspec'
require './lib/board'
require './lib/ship'
require './lib/cell'

describe Board do
  before(:each) do
    board = Board.new
    cruiser = Ship.new('Cruiser', 3)
    submarine = Ship.new('Submarine', 2)
  end

  it 'exists' do
    expect(board).to be_a(Board)
  end

  # will it return a hash of coordinates?
  xit '' do
    # TODO: expectation here
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