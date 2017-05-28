require "tic_tac_toe/version"
require "tic_tac_toe/board"
require "tic_tac_toe/cell"
require "tic_tac_toe/game"
require "tic_tac_toe/player"

module TicTacToe
  # Your code goes here...

  puts 'Welcome to Tic Tac Toe'
  role = { human: true, bot: false }
  players = []

  board = TicTacToe::Board.new

  players << TicTacToe::Player.new('JK', 'X', role[:human])
  players << TicTacToe::Player.new('Bot', 'O', role[:bot])

  game = TicTacToe::Game.new(board, players)

  puts ''
  game.start
  puts ''

end
