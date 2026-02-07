module ConnectFour
  class Board
    ROWS = 6
    COLS = 7

    attr_accessor :state

    def initialize
      @state = Array.new(ROWS) { Array.new(COLS, " ") }
    end
  end
end
