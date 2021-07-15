class Board
  attr_reader :cells

  def initialize
    @cells = cells
  end

  def cells
    # can refactor
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

  # helper method for valid_placement?
  def fits?(ship, coordinates)

    # checks ship and coords are same length
    # return value (true/false)
    ship.length == coordinates.length
  end

  # helper method for valid_placement?
  def placed_horizontally?(coordinates)

    # stores the first charcter (row) of each cell in coords into an array
    # can refactor
    horizontal_check = coordinates.map do |cell|
      cell[0]
    end

    # checks if ALL the letters in ^ array are equal to the first character in the first cell in coords
    # can refactor
    horizontal_check.all? do |letter|

      # this is the return value (true/false)
      letter == coordinates.first[0]
    end
  end

  # helper method for valid_placement?
  def placed_vertically?(coordinates)

    # stores the second character (column) of each cell in coords into an array
    # can refactor
    vertical_check = coordinates.map do |cell|
      cell[1]
    end

    # checks if ALL numbers in ^ array are equal to the second character in the first cell in coords
    # can refactor
    vertical_check.all? do |number|

      # this is the return value (true/false)
      number == coordinates.first[1]
    end
  end

  # i hate this method so fkn much, but idk how to refactor this any further
  def valid_placement?(ship, coordinates)

    # call helper method to see if same length
    if fits?(ship, coordinates)

      # call helper method to see if placed horizontally
      if placed_horizontally?(coordinates)

        # stores the second character (column) of each cell in coords into an array
        # can refactor
        columns = coordinates.map do |cell|
          cell[1]
        end

        # i figured out how to use each_cons (it was pain in the ass)
        # can convert it into an array of arrays... and assign it to a variable
        cons_columns = [1, 2, 3, 4].each_cons(coordinates.length).to_a

        # checks if columns are included in any consecutive columns array
        # return value (true/false)
        cons_columns.include?(columns)

      # call helper method to see if placed vertically
      elsif placed_vertically?(coordinates)

        # stores the first character (row) of each cell in coords into an array
        # can refactor
        rows = coordinates.map do |cell|
          cell[0]
        end

        # each consecutive array is stored into another array
        cons_rows = ["A", "B", "C", "D"].each_cons(coordinates.length).to_a

        # checks if rows are included in any consecutive rows array
        # return value (true/false)
        cons_rows.include?(rows)

      # if it's not placed horizontally or vertically, fail
      else
        false
      end

    # if it doesn't fit exactly, fail
    else
      false
    end

# =============================== OUR OLD CODE ===============================
    # if horizontal_row == true
    #   vertical_check = coordinates.map { |cell| cell[1].to_i }
    #   vertical_columns = [1, 2, 3, 4].each_cons(coordinates.length).to_a
    #   vertical_columns.include?(vertical_check)
    # end

    # a_hash = {
    #   "A" => ["A1", "A2", "A3", "A4"],
    #   "B" => ["B1", "B2", "B3", "B4"],
    #   "C" => ["C1", "C2", "C3", "C4"],
    #   "D" => ["D1", "D2", "D3", "D4"],
    #   "1" => ["A1", "B1", "C1", "D1"],
    #   "2" => ["A2", "B2", "C2", "D2"],
    #   "3" => ["A3", "B3", "C3", "D3"],
    #   "4" => ["A4", "B4", "C4", "D4"]
    # }

    # a = a_hash.values.find_all do |array|
    #   array.include?(coordinates[0])
    # end

    # a.each do |array|
    #   array.each_cons(example.length) do |array|
    #     require 'pry'; binding.pry
    #     array == example
    #   end
    # end
# =============================== OUR OLD CODE ===============================
  end
end
