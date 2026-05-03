# Represents a computer player
class ComputerPlayer
  def initialize(gameboard)
    @board = gameboard
  end

  def create_code
    code = Array.new(4)
    random = Random.new
    code.each_index { |index| code[index] = random.rand(1..6) }
    code
  end
end
