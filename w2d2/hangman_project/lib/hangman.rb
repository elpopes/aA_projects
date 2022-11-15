require 'byebug'
class Hangman
  # DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses
  def self.random_word
    words = File.readlines("dictionary.txt").map(&:chomp)
    @random_word = words.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    return @attempted_chars.include?(char) 
  end

  def get_matching_indices(char)
    @secret_word.split("").map.with_index {|letter, i| i if letter == char}.compact
  end

  def fill_indices(char, index_array)
    @guess_word.map!.with_index{|ele, i| index_array.include?(i) ? ele = char : ele = ele }
  end

  def try_guess(char)
    matches = get_matching_indices(char)
    fill_indices(char, matches)
    if already_attempted?(char)
      p 'that has already been attempted'
      return false
    end
    @attempted_chars << char
    @remaining_incorrect_guesses -= 1 if matches.empty? 
    return true
  end

  def ask_user_for_guess
    p 'Enter a char'
    guess = gets.chomp
    try_guess(guess)
  end

  def win?
    case @guess_word.join("") == @secret_word
    when true
      p 'WIN'
      return true      
    else
      return false
    end
  end
  
    def lose?
      if @remaining_incorrect_guesses == 0 
        print 'LOSE'
        return true
      end
      false
    end

    def game_over?
      case win? || lose?
      when true
        p @secret_word
        return true
      else
        return false
      end
    end

end
