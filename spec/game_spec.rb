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

    describe "#pick_random_starter" do
      it "returns either player_red or player_yellow" do
        starter = game.pick_random_starter
        expect([game.player_red, game.player_yellow]).to include(starter)
      end
    end

    describe "#make_player_cycler" do
      it "cycles between players starting with given player" do
        starter = game.player_red
        player_cycler = game.make_player_cycler(starter)
        expect(player_cycler.next).to eq(game.player_red)
        expect(player_cycler.next).to eq(game.player_yellow)
        expect(player_cycler.next).to eq(game.player_red)
      end
    end
  end
end
