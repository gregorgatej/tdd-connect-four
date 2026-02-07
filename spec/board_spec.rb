require_relative "../lib/connect_four"

describe ConnectFour::Board do
  describe "#initialize" do
    it "creates a 6x7 board" do
      board = ConnectFour::Board.new
      expect(board.state.length).to eq(6)
      expect(board.state[0].length).to eq(7)
    end

    it "fills the board with empty spaces" do
      board = ConnectFour::Board.new
      expect(board.state.flatten.all? { |cell| cell == " " }).to be true
    end
  end

  describe "#to_s" do
    it "returns a string representation of the board" do
      board = ConnectFour::Board.new
      expect(board.to_s).to include("|")
      expect(board.to_s).to include("+")
    end
  end
end
