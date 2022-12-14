class GuessingGame
    attr_reader :num_attempts, :game_over
    def initialize(min, max)
        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false
    end
    
    def game_over?
        @game_over
    end

    def check_num(guess)
        @num_attempts += 1
        case guess <=> @secret_num
        when 1
            p 'too big'
        when -1
            p 'too small'
        else
            p 'you win'
            @game_over = true
        end
    end

    def ask_user
        p 'enter a number'
        guess = gets.chomp.to_i
        check_num(guess)
    end

end


