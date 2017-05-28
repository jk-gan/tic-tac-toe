require_relative './cell.rb'

module TicTacToe
  class Board
    WIDTH = 3
    HEIGHT = 3

    attr_accessor :cells

    def initialize
      @cells = []
      @board = Array.new(HEIGHT){ Array.new(WIDTH) }
      WIDTH.times do |i|
        HEIGHT.times do |j|
          @cells << @board[i][j] = Cell.new('-')
        end
      end
    end

    def print_board
      WIDTH.times do |i|
        print '       '
        HEIGHT.times do |j|
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

    def mark_by(player, move)
      @cells[move].value = player.code
    end
  end
end
