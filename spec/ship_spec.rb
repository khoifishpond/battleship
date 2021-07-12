require 'rspec'
require './lib/ship'

describe Ship do
  context 'Attributes' do
    # before each test, run this
    before(:each) do
      cruiser = Ship.new("Cruiser", 3)
    end

    it 'exists' do
      # Kelsey writes a method to satisfy this test
      expect(cruiser).to be_a(Ship)
    end

    xit 'has a name' do
      # Kelsey writes a method to satisfy this test
      expect(cruiser.name).to eq("Cruiser")
    end

    xit 'has a length' do
      # Kelsey writes a method and expectation to satisfy this test
      expect().to eq()
    end

    xit 'has health' do
      # Kelsey writes a method and expectation to satisfy this test
      expect().to eq()
    end

    xit 'has a sunk status' do
      # Kelsey writes both the test and method
    end

    xit 'can be hit' do
      # Kelsey writes both the test and method
    end

    xit 'will lose health if hit' do
      # Kelsey writes both the test and method
    end

    xit 'will sink at 0 health' do
      # Kelsey writes both the test and method
    end
  end
end