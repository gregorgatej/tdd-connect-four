require_relative "../lib/connect_four"

describe ConnectFour::Player do
  player = ConnectFour::Player.new("🔴")
  describe "#initialize" do
    it "creates player with a mark" do
      expect(player.mark).to eq("🔴")
    end
  end

  describe "#to_s" do
    it "returns a string representation" do
      expect(player.to_s).to include("🔴")
    end
  end
end
