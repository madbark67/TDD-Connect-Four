require_relative 'board'
require_relative 'player'

class Game
  attr_accessor :players, :current_player

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

        puts 'Name cannot be empty'
      end

      loop do
        puts "#{@current_player.name} enter your icon:"
        @current_player.icon = gets.chomp
        break unless @current_player.icon.empty?

        puts 'Please select an icon'
      end
      tracker = 1 - tracker
      @current_player = @players[tracker]

    end
    switch_player
  end

  def get_column_input
    user_input = nil
    loop do
      puts "#{@current_player.name} please choose a column 1-7"
      user_input = gets.chomp.to_i
      next if user_input < 1 || user_input > 7

      user_input -= 1
      break unless @board.column_full?(user_input)
    end
    user_input
  end

  def display_board
    @board.grid.each { |row| p row }
  end

  def switch_player
    @current_player = @current_player == @players[0] ? @players[1] : @players[0]
  end
end
