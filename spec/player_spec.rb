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
    end

    it 'exists' do
      expect(@new_player).to be_a(Player)
    end

    it 'can fire upon' do
      @new_player.fire_at(@input.first)

      expect(@computer_board.cells[@input.first.to_sym].fired_upon?).to eq(true)
    end
  end
end
