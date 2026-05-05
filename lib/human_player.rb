# Represents a human player
class HumanPlayer
  def initialize(gameboard)
    @board = gameboard
  end

  def create_code
    print 'What is your secret code? '
    code = gets.chomp.to_i.digits.reverse
    until code_is_valid?(code)
      puts 'Code must be 4 digits long and only include the numbers 1-6.'
      print 'What is your secret code? '
      code = gets.chomp.to_i.digits.reverse
    end
    self.code = code
    code
  end

  def feedback
    puts "Guess was #{board.current_guess.join}. Code is #{code.join}."
    print 'Feedback: '
    response = gets.chomp.upcase.chars.sort
    until feedback_is_valid?(response)
      print 'Feedback (B or W or empty): '
      response = gets.chomp.upcase.chars.sort
    end
    response
  end

  def guess
    print 'What\'s your guess? '
    guess = gets.chomp.to_i.digits.reverse
    until code_is_valid?(guess)
      puts 'Code is 4 digits long and only includes the numbers 1-6.'
      print 'What\'s your guess? '
      guess = gets.chomp.to_i.digits.reverse
    end
  end

  def to_s
    'Human'
  end

  private

  attr_accessor :code, :board

  def code_is_valid?(code)
    code.all? { |digit| digit.between?(1, 6) } && code.size == 4
  end

  def feedback_is_valid?(feedback)
    return false if feedback.size > 4
    return true if feedback.empty?
    return false if feedback.none?('B') && feedback.none?('W')

    true
  end
end
