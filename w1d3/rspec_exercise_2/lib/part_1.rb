def partition(array, num)
    smallers = []
    biggers = []
    both = []
    array.each do |n|
        if n < num
            smallers << n
        else
            biggers << n
        end
    end
    both << smallers
    both << biggers
    both
end

def merge(hash1, hash2)
    new_hash = {}
    hash1.each {|k,v| new_hash[k] = v}
    hash2.each {|k,v| new_hash[k] = v}
    new_hash
end

def fix_word(word)
    vowels = "aeiou"
    new_word = ""
    word.each_char {|char, i| vowels.include?(char.downcase) ? new_word += "*" : new_word += char}
    new_word
end

def censor(sentence, curse_array)
    words = sentence.split(" ")
    words.map {|word| curse_array.include?(word.downcase) ? fix_word(word) : word}.join(" ") 
end

def power_of_two?(num)
    return true if num == 1 
    powers = 2
    num.times do 
        powers *= 2
        return true if powers == num
    end
    return false
end