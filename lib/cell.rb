class Cell
  attr_reader :coordinate, :ship, :is_empty, :is_fired_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @is_empty = true
    @is_fired_upon = false
  end

  def empty?
    @is_empty
  end

  def place_ship(ship)
    @ship = ship
    @is_empty = false
  end

  def fired_upon?
    @is_fired_upon
  end

  def fire_upon
    @ship.hit
    @is_fired_upon = true
  end

  def render(reveal = false)
    if reveal == true && @is_empty == false
      'S'
    else
      '.'
    end


  end
end
