# Represents a human player
class HumanPlayer
  def initialize(gameboard)
    @board = gameboard
  end

  def create_code
    print 'What is your secret code?'
    self.code = gets.chomp.to_i.digits.reverse
    code
  end

  def feedback
    puts "Guess was #{board.last_guess}. "
    print 'Feedback: '
    gets.chomp.chars.sort
  end

  def guess
    print 'What\'s your guess? '
    gets.chomp.to_i.digits.reverse
  end

  def to_s
    'Human'
  end

  private

  attr_accessor :code, :board
end
