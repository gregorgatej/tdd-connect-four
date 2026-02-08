require_relative "../lib/connect_four"

describe ConnectFour::Game do
  subject(:game) { described_class.new }
  describe "#initialize" do
    it "creates two players" do
      expect(game.player_red.mark).to eq("🔴")
      expect(game.player_yellow.mark).to eq("🟡")
    end

    it "creates a board" do
      expect(game.board).to be_a(ConnectFour::Board)
    end
  end
end
