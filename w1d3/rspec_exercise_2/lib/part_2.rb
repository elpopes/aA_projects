require "byebug"

def reverser(string)
    new_string = ""
    string.each_char {|char| new_string = char + new_string}
    new_string
end

def palindrome?(string)
    string == reverser(string)
end

def substrings(string)
    subs = []
    string.each_char.with_index do |char1, i|
        string.each_char.with_index do |char2, j|
            if i <= j
                subs << string[i..j]
            end
        end
    end
    subs
end

def palindrome_substrings(string)
    subs = substrings(string)
    subs.select {|pal| pal.length > 1 && palindrome?(pal)}
end