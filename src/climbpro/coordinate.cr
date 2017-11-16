class Climbpro::Coordinate
  def initialize(x : Int32, y : Int32)
    @x = x
    @y = y
  end

  def display
    @display_char
  end

  def index
    x + (y * 4)
  end

  def display_char(char : String)
    @display_char = char
  end

  def hash
    "(#{x},#{y})"
  end

  def x
    @x
  end

  def x=(other)
    @x = other
  end

  def y
    @y
  end

  def y=(other)
    @y = other
  end

  def clone
    Coordinate.new(
      x: x,
      y: y,
    )
  end
end
