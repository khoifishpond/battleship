require './lib/player'

class Computer < Player

def random_selection
pickle =  @board.cells.keys.sample
@board.cells[pickle]
# require "pry";binding.pry
end

end
