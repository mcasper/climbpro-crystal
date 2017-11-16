class Climbpro::Board
  TEN_BOARD = Board.new(
    rowsize: 4,
    columnsize: 6,
    pieces: [
      Piece.new(
        id: 1,
        shape: Piece::L,
        coordinates: [
          Coordinate.new(x: 0, y: 1),
          Coordinate.new(x: 0, y: 2),
          Coordinate.new(x: 1, y: 2),
        ],
      ),
      Piece.new(
        id: 2,
        shape: Piece::DOT,
        coordinates: [
          Coordinate.new(x: 2, y: 2),
        ],
      ),
      Piece.new(
        id: 3,
        shape: Piece::LINE,
        coordinates: [
          Coordinate.new(x: 3, y: 1),
          Coordinate.new(x: 3, y: 2),
        ],
      ),
      Piece.new(
        id: 4,
        shape: Piece::DOT,
        coordinates: [
          Coordinate.new(x: 0, y: 3),
        ],
      ),
      Piece.new(
        id: 5,
        shape: Piece::SQUARE,
        coordinates: [
          Coordinate.new(x: 1, y: 3),
          Coordinate.new(x: 2, y: 3),
          Coordinate.new(x: 1, y: 4),
          Coordinate.new(x: 2, y: 4),
        ],
      ),
      Piece.new(
        id: 6,
        shape: Piece::DOT,
        coordinates: [
          Coordinate.new(x: 3, y: 3),
        ],
      ),
      Piece.new(
        id: 7,
        shape: Piece::LINE,
        coordinates: [
          Coordinate.new(x: 0, y: 4),
          Coordinate.new(x: 0, y: 5),
        ],
      ),
      Piece.new(
        id: 8,
        shape: Piece::DOT,
        coordinates: [
          Coordinate.new(x: 1, y: 5),
        ],
      ),
      Piece.new(
        id: 9,
        shape: Piece::L,
        coordinates: [
          Coordinate.new(x: 3, y: 4),
          Coordinate.new(x: 3, y: 5),
          Coordinate.new(x: 2, y: 5),
        ],
      ),
      Piece.new(
        id: 10,
        shape: Piece::POST,
        coordinates: [
          Coordinate.new(x: 0, y: 0),
          Coordinate.new(x: 3, y: 0),
        ],
      ),
    ]
  )

  def initialize(rowsize : Int32, columnsize : Int32, pieces : Array(Piece), layer = 0)
    @layer = layer
    @rowsize = rowsize
    @columnsize = columnsize
    @pieces = pieces
  end

  def display
    coordinates = pieces.flat_map do |piece|
      piece.coordinates.each { |coord| coord.display_char(piece.display) }
      piece.coordinates
    end

    display_board = (0..(rowsize * columnsize - 1)).map do |i|
      coordinate = coordinates.select { |coord| coord.index == i }
      if coordinate.size == 1
        coordinate.first.display
      else
        " "
      end
    end

    display_board.each_with_index do |char, index|
      print(char)
      if ((index + 1) % rowsize) == 0
        puts
      end
    end
  end

  def layer
    @layer
  end

  def rowsize
    @rowsize
  end

  def columnsize
    @columnsize
  end

  def pieces
    @pieces
  end
end
