require_relative './board.rb'
require_relative './player.rb'
require_relative './game.rb'

puts 'Welcome to Tic Tac Toe'
role = { human: true, ai: false }
players = []

board = TicTacToe::Board.new
players << TicTacToe::Player.new('JK', 'X', role[:human])
players << TicTacToe::Player.new('XXX', 'O', role[:ai])
game = TicTacToe::Game.new(board, players)



puts ''
game.start
puts ''
