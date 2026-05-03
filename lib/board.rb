# Represents the game board
class Board
  attr_reader :code

  BOARD_SIZE = 12
  def initialize
    @board = array.new(Board::BOARD_SIZE)
  end

  def store_code(code)
    self.code = code
  end

  private

  attr_writer :code
end
