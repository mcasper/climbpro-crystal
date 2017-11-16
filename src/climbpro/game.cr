module Climbpro
  class Game
    def self.solve(board)
      boards = [board]
      hashes = [board.hash]

      while boards.size > 0
        next_boards = boards.flat_map do |board|
          board.make_moves(hashes)
        end

        # puts hashes
        # next_boards.each { |b| puts ""; puts b.hash; b.display }

        if next_boards.size > 0
          puts "Layer #{next_boards.first.layer} has #{next_boards.size} board(s)"

          next_boards.each do |board|
            if board.solved?
              puts "Solved it on layer #{board.layer}!!!!!!!!!!!!!!"
              board.display
            end
          end
        else
          puts "No more boards :("
        end

        boards = next_boards
      end
    end
  end
end
