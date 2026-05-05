require_relative 'lib/board'
require_relative 'lib/computer_player'
require_relative 'lib/human_player'

board = Board.new

puts 'Who do you want to play as?'
puts '1 - Codemaker'
puts '2 - Codebreaker'
response = gets.chomp
case response
when '1'
  codemaker = HumanPlayer.new(board)
  codebreaker = ComputerPlayer.new(board)
when '2'
  codemaker = ComputerPlayer.new(board)
  codebreaker = HumanPlayer.new(board)
end

board.players = { codemaker: codemaker, codebreaker: codebreaker }

board.store_code(codemaker.create_code)
board.display

until board.winner?
  board.insert(codebreaker.guess)
  board.insert(codemaker.feedback)
  board.display
end

puts "Code was #{board.show_code}"
puts "#{board.winner} won"
