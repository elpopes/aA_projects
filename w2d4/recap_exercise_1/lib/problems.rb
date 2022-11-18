
def all_vowel_pairs(words)
    words[0...-1].map.with_index {|word, i| 
        (i+1...words.length).map {|j| 
            to_pair(word, words[j]) if complete_pairs?(to_pair(word, words[j]))}.compact}.flatten
end

def to_pair(word_1, word_2)
    "#{word_1} #{word_2}"
end

def complete_pairs?(combo_str)
    "aeiou".each_char {|char| return false unless combo_str.include?(char)} 
    true
end

def composite?(num)
    (2...num).any? {|i| num % i == 0}
end


def find_bigrams(str, bigrams)
    bigrams.select {|bi| char_pairs(str).include?(bi)}
end

def char_pairs(str)
    str.split("")[0...-1].map.with_index{|char, i| char + str[i+1]}
end

class Hash

    def my_select(&prc)
        prc ||= Proc.new {|k,v| k == v}
        select {|k, v| prc.call(k,v)}
    end
end

class String

    def substrings(length = nil)
        all_subs.select {|ele| length.nil? ? ele : ele.length == length}
    end

    def all_subs
        self.split("").map.with_index{|ele, i| (i...length).map {|j| self[i..j]}}.flatten
    end


    require "byebug"
    def caesar_cipher(num)
        split("").map.with_index {|char, i| char.encoded(num)}.join("")
    end

    def encoded(num)
        alpha = ('a'..'z').to_a
        new_index = alpha.index(self) + num
        alpha[new_index % 26]
    end
end
