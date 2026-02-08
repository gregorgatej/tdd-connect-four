require_relative "../lib/connect_four"

describe ConnectFour::Board do
  subject(:board)  { described_class.new }
  describe "#initialize" do
    it "creates a 6x7 board" do
      expect(board.state.length).to eq(6)
      expect(board.state[0].length).to eq(7)
    end

    it "fills the board with empty spaces" do
      expect(board.state.flatten.all? { |cell| cell == " " }).to be true
    end
  end

  describe "#to_s" do
    it "returns a string representation of the board" do
      expect(board.to_s).to include("|")
      expect(board.to_s).to include("+")
    end
  end

  describe "#valid_move?" do
    it "returns true for empty columns in range" do
      expect(board.valid_move?(0)).to be true
      expect(board.valid_move?(6)).to be true
    end

    it "returns false for columns out of range" do
      expect(board.valid_move?(-1)).to be false
      expect(board.valid_move?(7)).to be false
    end

    it "returns false for full columns" do
      6.times { board.state[0][5] = "🔴" }
      expect(board.valid_move?(5)).to be false
    end
  end

  describe "#make_mark" do
    it "places mark in the lowest empty row of a column" do
      board.make_mark("🔴", 4)
      expect(board.state[5][4]).to eq("🔴")
    end

    it "stacks marks in the same column" do
      board.make_mark("🔴", 4)
      board.make_mark("🟡", 4)
      expect(board.state[5][4]).to eq("🔴")
      expect(board.state[4][4]).to eq("🟡")
    end

    it "raises error for invalid column" do
      expect { board.make_mark("🔴", 7) }.to raise_error(ArgumentError)
    end
  end

  describe "#winning_state?" do
    it "detects four in a row horizontally" do
      board.state[5] = ["🔴", "🔴", "🔴", "🔴", " ", " ", " "]
      expect(board.winning_state?("🔴")).to be true
    end

    it "returns false when no win condition horizontally" do
      board.state[5] = ["🔴", "🔴", "🔴", " ", " ", " ", " "]
      expect(board.winning_state?("🔴")).to be false
    end

    it "detects four in a row vertically" do
      4.times { |i| board.state[5-i][0] = "🔴" }
      expect(board.winning_state?("🔴")).to be true
    end

    it "detects for in a row diagonally (bottom-left to top-right)" do
      board.state[5][0] = "🔴"
      board.state[4][1] = "🔴"
      board.state[3][2] = "🔴"
      board.state[2][3] = "🔴"
      expect(board.winning_state?("🔴")).to be true
    end

    it "detects for in a row diagonally (bottom-right to top-left)" do
      board.state[5][6] = "🔴"
      board.state[4][5] = "🔴"
      board.state[3][4] = "🔴"
      board.state[2][3] = "🔴"
      expect(board.winning_state?("🔴")).to be true
    end
  end
end
