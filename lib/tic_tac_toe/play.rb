require_relative "./board"
require_relative "./game"
require_relative "./player"

puts 'Welcome to Tic Tac Toe'
role = { human: true, bot: false }
players = []

board = TicTacToe::Board.new

players << TicTacToe::Player.new('JK', role[:human])
players << TicTacToe::Player.new('Bot', role[:bot])

game = TicTacToe::Game.new(board, players)

puts ''
game.choose_position
puts ''
game.start
puts ''
