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
    ]
  )

  def initialize(rowsize : Int32, columnsize : Int32, pieces : Array(Piece), layer = 0)
    @layer = layer
    @rowsize = rowsize
    @columnsize = columnsize
    @pieces = pieces
  end

  def make_moves(hashes)
    boards = [] of Board

    pieces.each do |piece|
      (1..3).each do |count|
        new_board = clone
        new_board.layer += 1
        new_piece = new_board.pieces.select { |p| p.id == piece.id }.first
        new_piece.coordinates.each_with_index do |coordinate, index|
          coordinate.x -= count
          new_piece.coordinates[index] = coordinate
        end

        if new_board.valid?(hashes)
          boards << new_board
          hashes << new_board.hash
        else
          break
        end
      end

      (1..3).each do |count|
        new_board = clone
        new_board.layer += 1
        new_piece = new_board.pieces.select { |p| p.id == piece.id }.first
        new_piece.coordinates.each_with_index do |coordinate, index|
          coordinate.x += count
          new_piece.coordinates[index] = coordinate
        end

        if new_board.valid?(hashes)
          boards << new_board
          hashes << new_board.hash
        else
          break
        end
      end

      (1..5).each do |count|
        new_board = clone
        new_board.layer += 1
        new_piece = new_board.pieces.select { |p| p.id == piece.id }.first
        new_piece.coordinates.each_with_index do |coordinate, index|
          coordinate.y -= count
          new_piece.coordinates[index] = coordinate
        end

        if new_board.valid?(hashes)
          boards << new_board
          hashes << new_board.hash
        else
          break
        end
      end

      (1..5).each do |count|
        new_board = clone
        new_board.layer += 1
        new_piece = new_board.pieces.select { |p| p.id == piece.id }.first
        new_piece.coordinates.each_with_index do |coordinate, index|
          coordinate.y += count
          new_piece.coordinates[index] = coordinate
        end

        if new_board.valid?(hashes)
          boards << new_board
          hashes << new_board.hash
        else
          break
        end
      end
    end

    boards
  end

  def solved?
    squares = pieces.select { |piece| piece.shape == Piece::SQUARE }

    squares.any? do |piece|
      piece.coordinates.any? { |coordinate| coordinate.x == 1 && coordinate.y == 0 } &&
        piece.coordinates.any? { |coordinate| coordinate.x == 2 && coordinate.y == 0 }
    end
  end

  def display
    coordinates = pieces.flat_map do |piece|
      piece.coordinates.each { |coord| coord.display_char(piece.display) }
      piece.coordinates
    end

    display_board = (0..(rowsize * columnsize - 1)).map do |i|
      coordinate = coordinates.select { |coord| coord.index == i }
      if i == 0 || i == 3
        "@"
      elsif coordinate.size == 1
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

  def valid?(hashes)
    if hashes.includes?(hash)
      # puts "hashed away"
      # if layer == 4
      #   display
      # end
      return false
    end

    all_coordinates = pieces.flat_map { |piece| piece.coordinates }

    out_of_bounds_coordinates = all_coordinates.select do |coordinate|
      coordinate.x < 0 ||
        coordinate.x > 3 ||
        coordinate.y < 0 ||
        coordinate.y > 5 ||
        (coordinate.x == 0 && coordinate.y == 0) ||
        (coordinate.x == 3 && coordinate.y == 0)
    end

    if out_of_bounds_coordinates.size > 0
      return false
    end

    coord_indexes = all_coordinates.map { |coordinate| coordinate.index }
    coord_indexes.uniq.size == coord_indexes.size
  end

  def hash
    string = "#{rowsize.hash}#{columnsize.hash}"
    pieces.sort_by { |p| p.id }.reduce(string) { |acc, p| "#{acc}#{p.hash}" }
  end

  def clone
    Board.new(
      rowsize: rowsize,
      columnsize: columnsize,
      layer: layer,
      pieces: pieces.map { |piece| piece.clone }.sort_by { |piece| piece.id },
    )
  end

  def layer
    @layer
  end

  def layer=(other)
    @layer = other
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

  def pieces=(other)
    @pieces = other
  end
end
