# Represents the game board
class Board
  attr_accessor :players
  attr_reader :winner

  BOARD_SIZE = 12
  def initialize
    @board = Array.new(Board::BOARD_SIZE)
    @winner = nil
    @turn_number = 0
    @giving_feedback = false
  end

  def store_code(code)
    self.code = code
  end

  def insert(pegs)
    if giving_feedback?
      board[turn_number][:feedback] = pegs
      check_for_winner
      self.turn_number += 1
    else
      board[turn_number] = { guess: pegs, feedback: [] }
    end
    self.giving_feedback = !giving_feedback
  end

  def last_guess
    board[turn_number][:guess]
  end

  def display
    board.reverse.each do |row|
      puts row
    end
  end

  def show_code
    code if winner?
  end

  def winner?
    winner != nil
  end

  private

  attr_accessor :board, :code, :giving_feedback, :turn_number
  attr_writer :winner

  def giving_feedback?
    giving_feedback
  end

  def check_for_winner
    fb = board[turn_number][:feedback]
    if fb.count('B') == 4
      self.winner = players[:codebreaker]
    elsif turn_number == Board::BOARD_SIZE - 1
      self.winner = players[:codemaker]
    end
  end
end
