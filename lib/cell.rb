class Cell
  attr_reader :coordinate, :ship, :is_empty

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @is_empty = true
  end

  def empty?
    @is_empty
  end

  def place_ship(ship)
    @ship = ship
  end

end
