require_relative 'board'
require_relative 'player'

class Game
  attr_accessor :players

  def initialize
    @players = [Player.new('Player 1', nil), Player.new('Player 2', nil)]
    @board = Board.new
    @current_player = @players[0]
  end

  def setup
    tracker = 0
    until !@players[0].icon.nil? && !@players[1].icon.nil?
      loop do
        puts "#{@current_player.name} enter your name:"
        @current_player.name = gets.chomp
        break unless @current_player.name.empty?
      end

      loop do
        puts "#{@current_player.name} enter your icon:"
        @current_player.icon = gets.chomp
        break unless @current_player.icon.empty?
      end
      tracker = 1 - tracker
      @current_player = @players[tracker]

    end
  end
end
