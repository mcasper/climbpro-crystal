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

  def x
    @x
  end

  def y
    @y
  end
end
