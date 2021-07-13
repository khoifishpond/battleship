require 'rspec'
require './lib/ship'

describe Ship do
  context 'Attributes' do
    before(:each) do
      @cruiser = Ship.new("Cruiser", 3)
    end

    it 'exists' do
      expect(@cruiser).to be_a(Ship)
    end

    it 'has a name' do
      expect(@cruiser.name).to eq("Cruiser")
    end

    it 'has a length' do
      expect(@cruiser.length).to eq(3)
    end

    it 'has health' do
      expect(@cruiser.health).to eq(3)
    end

    it 'has a sunk status' do
      expect(@cruiser.sunk?).to eq(false)
    end

    it 'can be hit and will lose one health' do
      expect(@cruiser.health).to eq(3)

      @cruiser.hit

      expect(@cruiser.health).to eq(2)
    end

    it 'will sink at 0 health' do
      expect(@cruiser.sunk?).to eq(false)

      @cruiser.hit
      @cruiser.hit
      @cruiser.hit

      expect(@cruiser.health).to eq(0)
      expect(@cruiser.sunk?).to eq(true)
    end
  end
end