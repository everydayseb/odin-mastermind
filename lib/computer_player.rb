# Represents a computer player
class ComputerPlayer
  def initialize(gameboard)
    @board = gameboard
  end

  def create_code
    self.code = Array.new(4)
    random = Random.new
    code.each_index { |index| code[index] = random.rand(1..6) }
    puts "Code is #{code}"
    code
  end

  def feedback
    guess = board.last_guess
    feedback = []

    guess.each_with_index do |digit, index|
      if code[index] == digit
        feedback.push 'B'
      elsif code.include? digit
        feedback.push 'W'
      end
    end

    feedback.sort
  end

  def to_s
    'Computer'
  end

  private

  attr_accessor :board, :code
end
