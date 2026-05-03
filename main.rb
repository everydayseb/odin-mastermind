require_relative 'lib/board'
require_relative 'lib/computer_player'
require_relative 'lib/human_player'

board = Board.new
codemaker = ComputerPlayer.new(board)
codebreaker = HumanPlayer.new(board)

board.store_code(codemaker.create_code)

until board.winner?
  board.insert(codebreaker.guess)
  board.insert(codemaker.feedback)
end

puts "Code was #{board.code}"
puts "#{board.winner} won"
