require "pry"

require 'rspec'
require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/player'
require './lib/computer'


describe "Computer" do

  it 'exists' do
    @board = Board.new
    @new_computer = Computer.new(@board)

    expect(@new_computer).to be_a(Computer)
    expect(@new_computer.random_selection).to be_a(Cell)
  end
end
