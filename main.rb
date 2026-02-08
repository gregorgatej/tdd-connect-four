require_relative "lib/connect_four"

game = ConnectFour::Game.new
winner = game.play
puts "\nCongratulations, #{winner} has won the game!"
