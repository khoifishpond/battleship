require 'rspec'
require './lib/ship'
require './lib/cell'

describe "Cell" do
  context "Attributes" do
    before(:each) do
      @cell = Cell.new("B4")
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
  end
end
