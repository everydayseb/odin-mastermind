# Represents a computer player
class ComputerPlayer
  def initialize(gameboard)
    @board = gameboard
  end

  def create_code
    self.code = Array.new(4)
    random = Random.new
    code.each_index { |index| code[index] = random.rand(1..6) }
    code
  end

  def feedback(code = self.code, guess = board.current_guess)
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

  def guess
    candidates = self.canditates ||= create_candidates
    if board.turn_number.zero?
      candidates.delete([1, 1, 2, 2])
      return [1, 1, 2, 2]
    end

    candidates.select! do |candidate|
      feedback_matches?(board.last_guess, candidate, board.last_feedback)
    end

    # puts 'Candidates list'  # debug
    # p candidates            # debug

    candidates.pop
  end

  def to_s
    'Computer'
  end

  private

  attr_accessor :board, :code, :canditates

  def create_candidates
    [1, 2, 3, 4, 5, 6].repeated_permutation(4).to_a.shuffle
  end

  def feedback_matches?(last_guess, candidate, last_feedback)
    feedback(candidate, last_guess) == last_feedback
  end
end
