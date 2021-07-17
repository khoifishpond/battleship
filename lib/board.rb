class Board
  attr_reader :cells

  def initialize
    # rename these variables? method has the same name
    @cells = {
      :A1 => Cell.new("A1"),
      :A2 => Cell.new("A2"),
      :A3 => Cell.new("A3"),
      :A4 => Cell.new("A4"),
      :B1 => Cell.new("B1"),
      :B2 => Cell.new("B2"),
      :B3 => Cell.new("B3"),
      :B4 => Cell.new("B4"),
      :C1 => Cell.new("C1"),
      :C2 => Cell.new("C2"),
      :C3 => Cell.new("C3"),
      :C4 => Cell.new("C4"),
      :D1 => Cell.new("D1"),
      :D2 => Cell.new("D2"),
      :D3 => Cell.new("D3"),
      :D4 => Cell.new("D4")
    }
  end

  def cell_selection(cell)
    @cells[cell.to_sym]
  end

  def valid_coordinate?(coordinate)
    @cells.key?(coordinate.to_sym)
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

  def columns_consecutive?(coordinates)
    columns = coordinates.map do |coordinate|
      coordinate[1].to_i
    end

    cons_columns = [1, 2, 3, 4].each_cons(coordinates.length).to_a
    cons_columns.include?(columns)
  end

  def rows_consecutive?(coordinates)
    rows = coordinates.map do |coordinate|
      coordinate[0]
    end

    cons_rows = ["A", "B", "C", "D"].each_cons(coordinates.length).to_a
    cons_rows.include?(rows)
  end

  def consecutive?(coordinates)
    (placed_horizontally?(coordinates) || placed_vertically?(coordinates)) && (rows_consecutive?(coordinates) || columns_consecutive?(coordinates))
  end

  def not_overlapping?(coordinates)
    coordinates.all? do |coordinate|
      @cells[coordinate.to_sym].is_empty
    end
  end

  def valid_placement?(ship, coordinates)
    if fits?(ship, coordinates) && not_overlapping?(coordinates)
      if placed_horizontally?(coordinates) || placed_vertically?(coordinates)
        columns_consecutive?(coordinates) || rows_consecutive?(coordinates)
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
        @cells[coordinate.to_sym].place_ship(ship)
      end
    end
  end

  def render(reveal = false)
    rendered_board =
    "  1 2 3 4 \n" +
    "A #{@cells[:A1].render} #{@cells[:A2].render} #{@cells[:A3].render} #{@cells[:A4].render} \n" +
    "B #{@cells[:B1].render} #{@cells[:B2].render} #{@cells[:B3].render} #{@cells[:B4].render} \n" +
    "C #{@cells[:C1].render} #{@cells[:C2].render} #{@cells[:C3].render} #{@cells[:C4].render} \n" +
    "D #{@cells[:D1].render} #{@cells[:D2].render} #{@cells[:D3].render} #{@cells[:D4].render} \n"

    rendered_board_revealed =
    "  1 2 3 4 \n" +
    "A #{@cells[:A1].render(true)} #{@cells[:A2].render(true)} #{@cells[:A3].render(true)} #{@cells[:A4].render(true)} \n" +
    "B #{@cells[:B1].render(true)} #{@cells[:B2].render(true)} #{@cells[:B3].render(true)} #{@cells[:B4].render(true)} \n" +
    "C #{@cells[:C1].render(true)} #{@cells[:C2].render(true)} #{@cells[:C3].render(true)} #{@cells[:C4].render(true)} \n" +
    "D #{@cells[:D1].render(true)} #{@cells[:D2].render(true)} #{@cells[:D3].render(true)} #{@cells[:D4].render(true)} \n"

    if reveal == true
      rendered_board_revealed
    else
      rendered_board
    end
  end
end
