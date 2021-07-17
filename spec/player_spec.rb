require 'rspec'
require './lib/player'
require './lib/board'
require './lib/ship'
require './lib/cell'

describe Player do
  context 'Attributes' do
    before(:each) do
      @player_board = Board.new
      @computer_board = Board.new
      @new_player = Player.new(@player_board, @computer_board)
      @input = ["A1", "B1", "C1"]
      @cruiser = Ship.new("Cruiser", 3)
    end

    it 'exists' do
      expect(@new_player).to be_a(Player)
    end

    it 'starts with no coordinates selected' do
      expect(@new_player.coordinates).to eq([])
    end

    it 'can select coordinates' do
      expect(@new_player.select_coordinates(@input)).to eq(["A1", "B1", "C1"])
    end

    it 'can fire upon' do
      @new_player.fire_at(@input.first)

      expect(@board.cells[@input.first.to_sym].fired_upon?).to eq(true)
    end
  end
end
