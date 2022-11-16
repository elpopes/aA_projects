require_relative "board"
require_relative "player"


class Game
    def initialize(p1_mark, p2_mark)
        @player_1, @player_2 = Player.new(p1_mark), Player.new(p2_mark)
        @current_player = @player_1
    end

    def switch_turn
        @current_player == @player_1 ? @current_player = @player_2 : @current_player = @player_1
    end
end