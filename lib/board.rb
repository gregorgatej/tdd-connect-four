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

    def make_mark(mark, col)
      raise ArgumentError, "Invalid column" unless valid_move?(col)

      row = find_lowest_empty_row(col)
      state[row][col] = mark
    end

    def winning_state?(mark)
      horizontal_winning_state?(mark) || vertical_winning_state?(mark) || diagonal_winning_state?(mark)
    end

    private

    def find_lowest_empty_row(col)
      (ROWS - 1).downto(0).find { |row| state[row][col] == " " }
    end

    def horizontal_winning_state?(mark)
      state.any? { |row| four_in_a_row?(row, mark) }
    end

    def vertical_winning_state?(mark)
      (0...COLS).any? { |col| four_in_a_row?(column(col), mark) }
    end


    def diagonal_winning_state?(mark)
      check_diagonal_direction?(mark, 1, 1) || check_diagonal_direction?(mark, 1, -1)
    end

    def check_diagonal_direction?(mark, row_step, col_step)
      (0...ROWS).any? do |start_row|
        (0...COLS).any? do |start_col|
          four_in_diagonal?(mark, start_row, start_col, row_step, col_step)
        end
      end
    end

    def four_in_diagonal?(mark, start_row, start_col, row_step, col_step)
      (0..3).all? do |i|
        row = start_row + i * row_step
        col = start_col + i * col_step
        row >= 0 && row < ROWS && col >= 0 && col < COLS && state[row][col] == mark
      end
    end

    def column(col)
      state.map { |row| row[col] }
    end

    def four_in_a_row?(sequence, mark)
      sequence.each_cons(4).any? { |segment| segment.all?(mark) }
    end
  end
end
