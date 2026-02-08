module ConnectFour
  class Game
    attr_reader :player_red, :player_yellow, :board

    def initialize
      @player_red = Player.new("🔴")
      @player_yellow = Player.new("🟡")
      @board = Board.new
    end

    def pick_random_starter
      [player_red, player_yellow].sample
    end

    def make_player_cycler(starting_player)
      players = [player_red, player_yellow]
      players.rotate(players.index(starting_player)).cycle
    end

    def process_turn(player, col)
      board.make_mark(player.mark, col)
      board.winning_state?(player.mark) ? player : nil
    end
  end
end
