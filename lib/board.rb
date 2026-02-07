module ConnectFour
  class Board
    ROWS = 6
    COLS = 7

    attr_accessor :state

    def initialize
      @state = Array.new(ROWS) { Array.new(COLS, " ") }
    end

    def to_s
      display = state.map { |row| "| #{row.join(" | ")} |" }.join("\n")
      display + "\n+---+---+---+---+---+---+---+"
    end

    def valid_move?(col)
      col >= 0 && col < COLS && state[0][col] == " "
    end
  end
end
