require 'rspec'
require './lib/board'
require './lib/ship'
require './lib/cell'

describe Board do
  context 'Cells' do
    before(:each) do
      @board = Board.new
    end

    it 'exists' do
      expect(@board).to be_a(Board)
    end

    it 'has cells' do
      expect(@board.cells).to be_a(Hash)
      expect(@board.cells["A1"]).to be_a(Cell)
      expect(@board.cells["D3"]).to be_a(Cell)
    end
  end

  context 'Validation' do
    before(:each) do
      @board = Board.new
      @cruiser = Ship.new('Cruiser', 3)
      @submarine = Ship.new('Submarine', 2)
    end

    it 'has valid coordinates' do
      expect(@board.valid_coordinate?("A1")).to eq(true)
      expect(@board.valid_coordinate?("D4")).to eq(true)
      expect(@board.valid_coordinate?("A5")).to eq(false)
      expect(@board.valid_coordinate?("E1")).to eq(false)
      expect(@board.valid_coordinate?("A22")).to eq(false)
    end

    it 'has valid placement' do
      expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to eq(false)
    end

    it 'has consecutive placement' do
      expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["A1", "C1"])).to eq(false)
      expect(@board.valid_placement?(@cruiser, ["A3", "A2", "A1"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["C1", "B1"])).to eq(false)
    end

    it 'cannot be placed diagonally' do
      expect(@board.valid_placement?(@cruiser, ["A1", "B2", "C3"])).to eq(false)
      expect(@board.valid_placement?(@submarine, ["C2", "D3"])).to eq(false)
    end
  end

  context 'Placing Ships' do
    before(:each) do
      @board = Board.new
      @cruiser = Ship.new('Cruiser', 3)
      @submarine = Ship.new('Submarine', 2)
      @board.place(@cruiser, ["A1", "A2", "A3"])
    end

    it 'can place a ship' do
      cell_1 = @board.cells["A1"]
      cell_2 = @board.cells["A2"]
      cell_3 = @board.cells["A3"]

      cell_1.ship
      cell_2.ship
      cell_2.ship

      expect(cell_3.ship == cell_2.ship).to eq(true)
    end

    it 'cannot overlap ships' do
      expect(@board.valid_placement?(@submarine, ["A2", "B2"])).to eq(false)
    end
  end

  context 'Render board' do
    before(:each) do
      @board = Board.new
      @cruiser = Ship.new('Cruiser', 3)
      @board.place(@cruiser, ["A1", "A2", "A3"])
    end

    it 'renders a board' do
      expect(@board.render).to eq("  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n")
      expect(@board.render(true)).to eq("  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n")
    end
  end
end
