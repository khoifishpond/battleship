class Ship
  attr_reader :name, :length, :health, :is_sunk

  def initialize(name, length)
    @name = name
    @length = length
    @health = @length
    @is_sunk = false
  end

  def sunk?
    if @health > 0
      @is_sunk
    else
      @is_sunk = true
    end
  end

  def hit
    @health -= 1
  end
end