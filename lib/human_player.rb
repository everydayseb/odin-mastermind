# Represents a human player
class HumanPlayer
  def initialize(gameboard)
    @board = gameboard
  end

  def guess
    print 'What\'s your guess? '
    gets.chomp.to_i.digits.reverse
  end

  def to_s
    'Human'
  end
end
