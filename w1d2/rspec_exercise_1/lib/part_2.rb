require "byebug"

def hipsterfy(word)
    without_vowel = remove_first_vowel(word.reverse.split(""))
    without_vowel.join("").reverse
end

def remove_first_vowel(array)
    array.each_with_index do |char, i|
        if "aeiou".include?(char.downcase)
            return array[0...i] + array[i+1..-1]
        end
    end
    array
end

def vowel_counts(string)
    hash = Hash.new(0)
    string.each_char {|char| hash[char.downcase] += 1 if "aeiou".include?(char.downcase)}     
    hash
end

def caesar_cipher(string, n)
    alpha = ('a'..'z').to_a
    string.each_char.with_index do |char, i|
        if alpha.include?(char)
            location = (alpha.index(char) + n) % 26
            coded = alpha[location]
            string[i] = coded
        end
    end
    string
end

