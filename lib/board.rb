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
  end
end
