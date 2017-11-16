class Climbpro::Piece
  SQUARE = "square"
  L = "l"
  DOT = "dot"
  LINE = "line"
  POST = "post"

  def initialize(id : Int32, shape : String, coordinates : Array(Coordinate))
    @id = id
    @shape = shape
    @coordinates = coordinates
  end

  def display
    case shape
    when SQUARE
      "X"
    when L
      "l"
    when DOT
      "O"
    when LINE
      "|"
    when POST
      "@"
    else
      "$"
    end
  end

  def id
    @id
  end

  def shape
    @shape
  end

  def coordinates
    @coordinates
  end
end
