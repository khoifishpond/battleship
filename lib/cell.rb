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
    @ship.hit if @is_empty == false #I think we need to make this a conditional if @is_empty false
    @is_fired_upon = true
  end

  def render(reveal = false)
    def make_s
      if reveal == true && @is_empty == false
        'S'
      else
        '.'
      end
    end


  end

  def make_m
    if reveal == true && @is_empty == true
      'M'
    else
      '.'
    end
  end

  def make_h #same as make_s before && is_fired_upon
    if @cell.make_s && @is_fired_upon == true #is there a way to use fire_upon here?
      'H'
    else
      '.'
    end
  end

  def make_x
    if reveal == true && @is_empty == false && @is_fired_upon == true
  end

end
