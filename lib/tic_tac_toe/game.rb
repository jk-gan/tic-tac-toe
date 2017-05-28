require_relative './board.rb'
require_relative './player.rb'

module TicTacToe
  class Game
    #
    #  0 | 1 | 2
    # ---+---+---
    #  3 | 4 | 5
    # ---+---+---
    #  6 | 7 | 8

    WINNING_COMBINATIONS = [
      [0, 1, 2], # Win Rows
      [3, 4, 5], # Win Rows
      [6, 7, 8], # Win Rows
      [0, 3, 6], # Win Cols
      [1, 4, 7], # Win Cols
      [2, 5, 8], # Win Cols
      [0, 4, 8], # Win Diag
      [2, 4, 6]  # Win Diag
    ]

    def initialize(board, players)
      @board = board
      @players = players
    end

    def choose_position
      puts 'Choose who will be first:'
      puts '1. You'
      puts '2. Bot'

      choice = gets.strip.to_i
      if choice == 1
        @players[0].code = 'X'
        @players[1].code = 'O'
        @current_player = @players[0]
      elsif choice == 2
        @players[0].code = 'O'
        @players[1].code = 'X'
        swicth_player
      else
        puts 'Invalid input'
        choose_position
      end
    end

    def start
      round = 1
      @board.print_board
      puts ''
      while playing?
        swicth_player if round > 1
        if @current_player.is_human?
          human_select
        else
          bot_select
        end
        round += 1
      end
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

      print 'Your choice: '
      move = @current_player.select_cell
      if move <= 0 or move >= 10
        puts 'Input out of range. Choose a new one.'
        puts ''
        @board.print_board
        human_select
      elsif !@board.cells[move - 1].available?
        puts "#{move} is not available. Choose a new one."
        puts ''
        @board.print_board
        human_select
      else
        @board.mark_by(@current_player, move - 1)
        puts ''
        @board.print_board
      end
    end

    def bot_select
      puts ''
      puts 'Bot is selecting...'

      bot_ai(@board, 0, @players)
      @board.print_board
    end

    def bot_ai(board, depth, players) # minimax algorithm

      if win?(board, players[1])
        return -10 + depth
      end

      if full?(board)
        return 0
      end

      max = -Float::INFINITY
      index = 0

      for i in 0...9
        if(board.cells[i].available?)
          newBoard = Marshal.load(Marshal.dump(board)) # deep copy of board object
          newBoard.cells[i].value = players[0].code
          moveVal = - bot_ai(newBoard, depth + 1, players.rotate)

          if moveVal > max
            max = moveVal
            index = i
          end
        end
      end

      if depth == 0
        @board.mark_by(@current_player, index)
        puts "#{@current_player.name} chose #{index + 1}"
        puts ''
      end

      max
    end

    def playing?
      if win?(@board, @current_player)
        puts "\n#{@current_player.name} Win!!!!"
        return false
      elsif full?(@board)
        puts "\nDraw game"
        return false
      else
        return true
      end
    end

    def win?(board, player)
      8.times do |i|
        win = true
        3.times do |j|
          if board.cells[WINNING_COMBINATIONS[i][j]].value != player.code
            win = false
            break
          end
        end
        return true if win
      end
      return false
    end

    def full?(board)
      9.times do |i|
        return false if board.cells[i].available?
      end

      return true
    end

    def swicth_player
      @players.rotate!
      @current_player = @players[0]
    end

  end
end
