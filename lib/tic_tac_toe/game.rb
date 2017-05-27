require_relative './board.rb'
require_relative './player.rb'

module TicTacToe
  class Game
    HUMAN = 0
    AI = 1

    #
    #  - | - | -
    # ---+---+---
    #  - | - | -
    # ---+---+---
    #  - | - | -

    WINNING = [
      [[0][0], [0][1], [0][2]], # Win Rows
      [[1][0], [1][1], [1][2]], # Win Rows
      [[2][0], [2][1], [2][2]], # Win Rows
      [[0][0], [1][0], [2][0]], # Win Cols
      [[0][1], [1][1], [2][1]], # Win Cols
      [[0][2], [1][2], [2][2]], # Win Cols
      [[0][0], [1][1], [2][2]], # Win Diag
      [[0][2], [1][1], [2][0]]  # Win Diag
    ]

    def initialize(board, players)
      @board = board
      @players = players
      @current_player = @players[0]
    end

    def start
      @board.print_board
      puts ''
      human_select if @current_player.is_human?
    end

    def human_select
      puts <<-EOB

      Choose the move:

        1 | 2 | 3
       ---+---+---
        4 | 5 | 6
       ---+---+---
        7 | 8 | 9

      EOB

      # move = gets.strip.to_i
    end
  end
end
