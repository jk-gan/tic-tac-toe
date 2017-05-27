require_relative './cell.rb'

module TicTacToe
  class Board
    WIDTH = 3
    HEIGHT = 3

    def initialize
      @board = Array.new(HEIGHT){ Array.new(WIDTH) }
      3.times do |i|
        3.times do |j|
          @board[i][j] = Cell.new('-')
        end
      end
    end

    def print_board
      3.times do |i|
        print '       '
        3.times do |j|
          print j != 2 ? " #{@board[i][j].value} |" : " #{@board[i][j].value} "
        end
        puts ''
        puts '       ---+---+---' if i != 2
      end
      # puts <<-EOB
      #   - | - | -
      #  ---+---+---
      #   - | - | -
      #  ---+---+---
      #   - | - | -
      # EOB
    end
  end
end
