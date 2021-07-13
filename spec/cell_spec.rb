require 'rspec'
require './lib/ship'
require './lib/cell'

describe "Cell" do
  context "Attributes" do
    before(:each) do
      @cell = Cell.new("B4")
      @cruiser = Ship.new("Cruiser", 3)
    end

    it "exists" do
      expect(@cell).to be_a(Cell)
    end

    it "has a coordinate" do
      expect(@cell.coordinate).to eq("B4")
    end

    it "has a ship" do
      expect(@cell.ship).to eq(nil)
    end

    it "defaults to empty" do
      expect(@cell.empty?).to eq(true)
    end

    it "can place a ship" do
      expect(@cell.ship).to eq(nil)
      @cell.place_ship(@cruiser)
      expect(@cell.ship).to eq(@cruiser)
      expect(@cell.empty?).to eq(false)
    end
  end

  context "Fired Upon" do
    before(:each) do
      @cell = Cell.new("B4")
      @cruiser = Ship.new("Cruiser", 3)
    end

    it "fired upon defaults to false" do
      expect(@cell.fired_upon?).to eq(false)
    end
    
  end
end
