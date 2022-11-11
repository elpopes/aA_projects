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


def conjunct_select(array, *prcs)
    array.select {|ele| prcs.each{|prc| prc.call(ele)}}
end


puts
puts 'CONJUNCT_SELECT'
is_positive = Proc.new { |n| n > 0 }
is_odd = Proc.new { |n| n.odd? }
less_than_ten = Proc.new { |n| n < 10 }

p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

