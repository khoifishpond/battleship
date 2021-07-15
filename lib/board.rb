require 'pry'
class Board
  attr_reader :cells

  def initialize
    # rename these variables? method has the same name
    @cells = cells
  end

  def cells
    # we can use ordinal values here to create a board?
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
    }
  end

  def valid_coordinate?(coordinate)
    @cells.key?(coordinate)
  end

  def fits?(ship, coordinates)
    ship.length == coordinates.length
  end

  def placed_horizontally?(coordinates)
    horizontal_check = coordinates.map do |coordinate|
      coordinate[0]
    end

    horizontal_check.all? do |letter|
      letter == coordinates.first[0]
    end
  end

  def placed_vertically?(coordinates)
    vertical_check = coordinates.map do |coordinate|
      coordinate[1]
    end

    vertical_check.all? do |number|
      number == coordinates.first[1]
    end
  end

  def not_overlapping?(coordinates)
    coordinates.all? do |coordinate|
      @cells[coordinate].is_a?(Cell)
    end
  end

  # THIS IS SO HIDEOUS @___@
  def valid_placement?(ship, coordinates)
    if fits?(ship, coordinates)
      if not_overlapping?(coordinates)
        if placed_horizontally?(coordinates)
          columns = coordinates.map do |coordinate|
            coordinate[1].to_i
          end
          cons_columns = [1, 2, 3, 4].each_cons(coordinates.length).to_a
          cons_columns.include?(columns)
        elsif placed_vertically?(coordinates)
          rows = coordinates.map do |coordinate|
            coordinate[0]
          end
          cons_rows = ["A", "B", "C", "D"].each_cons(coordinates.length).to_a
          cons_rows.include?(rows)
        else
          false
        end
      else
        false
      end
    else
      false
    end
  end

  def place(ship, coordinates)
    if valid_placement?(ship, coordinates)
      coordinates.each do |coordinate|
        @cells[coordinate].place_ship(ship)
      end
    end
  end

  def render(reveal = false)
    @cells.each_valuec do |cell|
      binding.pry


      # if cell.is_a?(Cell) || cell.is_a?(Ship)
      #   cell.render
      # end
    end
  end
end
