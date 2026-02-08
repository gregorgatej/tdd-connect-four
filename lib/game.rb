module ConnectFour
  class Game
    attr_reader :player_red, :player_yellow, :board

    def initialize
      @player_red = Player.new("🔴")
      @player_yellow = Player.new("🟡")
      @board = Board.new
    end
  end
end
