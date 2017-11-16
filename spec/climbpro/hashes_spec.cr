require "../spec_helper"

describe "Hashes" do
  it "works" do
    board1 = Climbpro::Board.new(rowsize: 1, columnsize: 2, pieces: [] of Climbpro::Piece)
    board2 = Climbpro::Board.new(rowsize: 1, columnsize: 2, pieces: [] of Climbpro::Piece)
    board1.hash.should eq(board2.hash)
  end

  it "" do
    board1 = Climbpro::Board.new(rowsize: 1, columnsize: 2, pieces: [
      Climbpro::Piece.new(
        id: 1,
        shape: "dot",
        coordinates: [
          Climbpro::Coordinate.new(x: 1, y: 1)
        ]
      )
    ])
    board2 = Climbpro::Board.new(rowsize: 1, columnsize: 2, pieces: [
      Climbpro::Piece.new(
        id: 1,
        shape: "dot",
        coordinates: [
          Climbpro::Coordinate.new(x: 1, y: 1)
        ]
      )
    ])
    board1.hash.should eq(board2.hash)
  end

  it "" do
    board1 = Climbpro::Board.new(rowsize: 1, columnsize: 2, pieces: [
      Climbpro::Piece.new(
        id: 1,
        shape: "l",
        coordinates: [
          Climbpro::Coordinate.new(x: 1, y: 0),
          Climbpro::Coordinate.new(x: 1, y: 1),
        ]
      )
    ])
    board2 = Climbpro::Board.new(rowsize: 1, columnsize: 2, pieces: [
      Climbpro::Piece.new(
        id: 1,
        shape: "l",
        coordinates: [
          Climbpro::Coordinate.new(x: 1, y: 1),
          Climbpro::Coordinate.new(x: 1, y: 2),
        ]
      )
    ])
    board1.hash.should_not eq(board2.hash)
  end

  it "" do
    board1 = Climbpro::Board.new(rowsize: 1, columnsize: 2, pieces: [
      Climbpro::Piece.new(
        id: 1,
        shape: "dot",
        coordinates: [
          Climbpro::Coordinate.new(x: 1, y: 0),
        ]
      ),
      Climbpro::Piece.new(
        id: 2,
        shape: "dot",
        coordinates: [
          Climbpro::Coordinate.new(x: 1, y: 1),
        ]
      ),
    ])
    board2 = Climbpro::Board.new(rowsize: 1, columnsize: 2, pieces: [
      Climbpro::Piece.new(
        id: 2,
        shape: "dot",
        coordinates: [
          Climbpro::Coordinate.new(x: 1, y: 1),
        ]
      ),
      Climbpro::Piece.new(
        id: 1,
        shape: "dot",
        coordinates: [
          Climbpro::Coordinate.new(x: 1, y: 0),
        ]
      ),
    ])
    board1.hash.should eq(board2.hash)
  end

  it "" do
    board1 = Climbpro::Board.new(layer: 5, rowsize: 1, columnsize: 2, pieces: [
      Climbpro::Piece.new(
        id: 2,
        shape: "dot",
        coordinates: [
          Climbpro::Coordinate.new(x: 1, y: 1),
        ]
      ),
      Climbpro::Piece.new(
        id: 1,
        shape: "dot",
        coordinates: [
          Climbpro::Coordinate.new(x: 1, y: 0),
        ]
      ),
    ])
    board2 = Climbpro::Board.new(layer: 8, rowsize: 1, columnsize: 2, pieces: [
      Climbpro::Piece.new(
        id: 2,
        shape: "dot",
        coordinates: [
          Climbpro::Coordinate.new(x: 1, y: 1),
        ]
      ),
      Climbpro::Piece.new(
        id: 1,
        shape: "dot",
        coordinates: [
          Climbpro::Coordinate.new(x: 1, y: 0),
        ]
      ),
    ])
    board1.hash.should eq(board2.hash)
  end

  it "" do
    board1 = Climbpro::Board.new(layer: 5, rowsize: 1, columnsize: 2, pieces: [
      Climbpro::Piece.new(
        id: 2,
        shape: "dot",
        coordinates: [
          Climbpro::Coordinate.new(x: 1, y: 1),
        ]
      ),
      Climbpro::Piece.new(
        id: 1,
        shape: "dot",
        coordinates: [
          Climbpro::Coordinate.new(x: 1, y: 0),
        ]
      ),
      Climbpro::Piece.new(
        id: 3,
        shape: "l",
        coordinates: [
          Climbpro::Coordinate.new(x: 0, y: 3),
          Climbpro::Coordinate.new(x: 0, y: 4),
          Climbpro::Coordinate.new(x: 1, y: 4),
        ]
      ),
    ])
    board2 = Climbpro::Board.new(layer: 5, rowsize: 1, columnsize: 2, pieces: [
      Climbpro::Piece.new(
        id: 2,
        shape: "dot",
        coordinates: [
          Climbpro::Coordinate.new(x: 1, y: 1),
        ]
      ),
      Climbpro::Piece.new(
        id: 1,
        shape: "dot",
        coordinates: [
          Climbpro::Coordinate.new(x: 1, y: 0),
        ]
      ),
      Climbpro::Piece.new(
        id: 3,
        shape: "l",
        coordinates: [
          Climbpro::Coordinate.new(x: 1, y: 3),
          Climbpro::Coordinate.new(x: 1, y: 4),
          Climbpro::Coordinate.new(x: 0, y: 4),
        ]
      ),
    ])
    board1.hash.should_not eq(board2.hash)
  end
end
