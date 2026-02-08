module ConnectFour
  class Game
    attr_reader :player_red, :player_yellow, :board

    def initialize
      @player_red = Player.new("🔴")
      @player_yellow = Player.new("🟡")
      @board = Board.new
    end

    def play
      starting_player = pick_random_starter
      puts "#{starting_player} will start the game!"
      puts "Each turn pick a column (0-6) to drop your piece:\n\n"
      puts board

      player_cycler = make_player_cycler(starting_player)

      loop do
        current_player = player_cycler.next
        puts "\n#{current_player}, pick a column (0-6):"
        col = gets.chomp.to_i

        next unless board.valid_move?(col)

        winner = process_turn(current_player, col)
        puts "\nNew state of the board:"
        puts board

        return winner if winner
      end
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
