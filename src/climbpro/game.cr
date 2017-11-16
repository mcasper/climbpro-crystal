module Climbpro
  class Game
    def self.solve(board)
      boards = [board]
      hashes = { board.hash => 1 }
      start = Time.now

      while boards.size > 0
        next_boards = boards.flat_map do |board|
          board.make_moves(hashes)
        end

        if next_boards.size > 0
          puts "Layer #{next_boards.first.layer} has #{next_boards.size} board(s) - #{Time.now - start}"

          if next_boards.first.layer > 28
            next_boards.each do |board|
              if board.solved?
                puts "Solved it on layer #{board.layer}!!!!!!!!!!!!!!"
                board.display
                break
              end
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
