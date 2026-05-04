require_relative 'lib/board'
require_relative 'lib/computer_player'
require_relative 'lib/human_player'

board = Board.new
codemaker = ComputerPlayer.new(board)
codebreaker = HumanPlayer.new(board)
board.players = { codemaker: codemaker, codebreaker: codebreaker }

board.store_code(codemaker.create_code)

until board.winner?
  board.insert(codebreaker.guess)
  board.insert(codemaker.feedback)
  board.display
end

puts "Code was #{board.show_code}"
puts "#{board.winner} won"
