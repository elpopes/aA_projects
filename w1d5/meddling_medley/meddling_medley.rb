def duos(string)
    counter = 0
    string.split("")[0...-1].each_with_index {|char, i| counter += 1 if char == string[i+1]}
    counter 

end
puts "duos".upcase
p duos('bootcamp')      # 1
p duos('wxxyzz')        # 2
p duos('hoooraay')      # 3
p duos('dinosaurs')     # 0
p duos('e')             # 0
puts 

def sentence_swap(sentence, hash)
    sentence.split(" ").map {|word| hash.has_key?(word) ? hash[word] : word}.join(" ")
end

puts 'sentence_swap'.upcase
p sentence_swap('anything you can do I can do',
    'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
) # 'nothing you shall drink I shall drink'

p sentence_swap('what a sad ad',
    'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
) # 'make a happy ad'

p sentence_swap('keep coding okay',
    'coding'=>'running', 'kay'=>'pen'
) # 'keep running okay'
puts


def hash_mapped(hash, prc, &blc)
    new_hash = {}
    hash.each {|k, v| new_hash[blc.call(k)] = prc.call(v) }
    new_hash
end

puts "HASH_MAPPED"
double = Proc.new { |n| n * 2 }
p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

first = Proc.new { |a| a[0] }
p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# {25=>"q", 36=>"w"}
puts

def counted_characters(string)
    counter = Hash.new(0)
    string.each_char {|char| counter[char] += 1}
    counter.filter {|k,v| v > 2}.keys
end

puts "counted_character".upcase
p counted_characters("that's alright folks") # ["t"]
p counted_characters("mississippi") # ["i", "s"]
p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
p counted_characters("runtime") # []

def triplet_true(string)
    counter = Hash.new(0)
    string.each_char {|char| counter[char] += 1}
    counter.values.any? {|v| v > 2}
end


puts
puts "TRIPLET_TRUE?"
p triplet_true('caaabb')        # true
p triplet_true('terrrrrible')   # true
p triplet_true('runninggg')     # true
p triplet_true('bootcamp')      # false
p triplet_true('e')             # false

def energetic_encoding(string, hash)
    new_words = []
    new_word = ""
    words = string.split(" ")
    words.each do |word|
        word.each_char do |char|
            if hash.has_key?(char) 
                new_word += hash[char] 
            else
                new_word += "?"
            end
        end
        new_words << new_word
        new_word = ""
    end
    new_words.join(" ")
end

puts
puts 'energetic_encoding'.upcase
p energetic_encoding('sent sea',
    'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
) # 'zimp ziu'

p energetic_encoding('cat',
    'a'=>'o', 'c'=>'k'
) # 'ko?'

p energetic_encoding('hello world',
    'o'=>'i', 'l'=>'r', 'e'=>'a'
) # '?arri ?i?r?'

p energetic_encoding('bike', {}) # '????'

def uncompress(string)
    new_string = ""
    string.each_char.with_index do |char,i| 
        if char.to_i > 0 
            char.to_i.times do 
                new_string += string[i-1] 
            end
        end
    end
    new_string
end

puts
puts "uncompress".upcase
p uncompress('a2b4c1') # 'aabbbbc'
p uncompress('b1o2t1') # 'boot'
p uncompress('x3y1x2z4') # 'xxxyxxzzzz'

require 'byebug'
def conjunct_select(array, *prcs)
    array.select do |ele|
        prcs.all? do |prc|        
            prc.call(ele)
        end
    end 
end

puts
puts 'CONJUNCT_SELECT'
is_positive = Proc.new { |n| n > 0 }
is_odd = Proc.new { |n| n.odd? }
less_than_ten = Proc.new { |n| n < 10 }

p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]


def convert_pig_latin(sentence)
    sentence.split(" ").map {|word| word.length < 3 ? word : pigafy(word)}.join(" ")
end

def pigafy(word)
    temp_word = 'aeiou'.include?(word[0].downcase) ? word + 'yay' : splice(word) + 'ay' 
    word[0] == word[0].upcase ? temp_word.capitalize : temp_word 
end

def splice(word)
    first = first_vowel_index(word)
    word[first..-1] + word[0...first]
end

def first_vowel_index(word)
    word.each_char.with_index {|char, i| return i if 'aeiou'.include?(char.downcase) }
end

puts 
puts "CONVERT_PIG_LATIN"
p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

def reverberate(sentence)
    sentence.split(" ").map {|word| word.length < 3 ? word : reverbify(word)}.join(" ")
end

def reverbify(word)
    temp_word = 'aeiou'.include?(word[-1].downcase) ? word + word : splitit(word)
    word[0] == word[0].upcase ? temp_word.capitalize : temp_word
end

def splitit(word)
    last = vowel_indies(word).last
    word + word[last..-1]
end

def vowel_indies(word)
    indies = []
    word.each_char.with_index {|char, i| indies << i if "aeiou".include?(char.downcase)} 
    indies
end
puts
puts "reveberate".upcase
p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

def disjunct_select(array, *prcs)
    array.select{|ele| prcs.any?{|prc| prc.call(ele)}}
end

puts
puts "disjunct_select".upcase
longer_four = Proc.new { |s| s.length > 4 }
contains_o = Proc.new { |s| s.include?('o') }
starts_a = Proc.new { |s| s[0] == 'a' }

p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
) # ["apple", "teeming"]

p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
    contains_o
) # ["dog", "apple", "teeming", "boot"]

p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
    contains_o,
    starts_a
) # ["ace", "dog", "apple", "teeming", "boot"]


def alternating_vowel(sentence)
    sentence.split(" ").map.with_index {|word, i| i.even? ? strip_first(word) : strip_last(word)}.join(" ")
end

def strip_first(word)
    indy = vowel_indies(word).first
    word.split("").select.with_index {|char, i| i != indy}.join("")
end

def strip_last(word)
    indy = vowel_indies(word).last
    word.split("").select.with_index {|char, i| i != indy}.join("")
end

puts
puts "alternating_vowel".upcase
p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
p alternating_vowel('code properly please') # "cde proprly plase"
p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"

def silly_talk(sentence)
    sentence.split(" ").map {|word| "aeiou".include?(word[-1].downcase) ? word + word[-1] : beebify(word)}.join(" ")
end

def beebify(word)
    new_word = ""
    word.each_char.with_index {|char, i| "aeiou".include?(char) ? new_word += char + "b" + char : new_word += char}
    new_word
end

puts
puts "silly_talk".upcase
p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
p silly_talk('They can code') # "Thebey caban codee"
p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"

def compress(string)
    counter = 1
    new_string = ""
    string.each_char.with_index do |char, i|
        j = i + 1
        if char == string[j] 
            counter += 1
        elsif counter > 1 && char != string[j] 
            new_string += char + counter.to_s
            counter = 1
        else
            new_string += char
            counter = 1
        end
    end
    new_string
end
puts
puts "compress".upcase
p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"


class Integer
    def is_prime?
        return false if self < 2 
        (2...self).each ldjaljda
    end
end