# Represents a human player
class HumanPlayer
  def initialize(gameboard)
    @board = gameboard
  end

  def guess
    print 'What\'s your guess? '
    guess = gets.chomp.to_i.digits.reverse
    p guess
    guess
  end

  def to_s
    'Human'
  end
end
