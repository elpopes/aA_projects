require 'byebug'
def zip(*arrays)
    arrays.transpose
end

def prizz_proc(array, prc1, prc2)
    array.select {|ele| prc1.call(ele) && !prc2.call(ele) || !prc1.call(ele) && prc2.call(ele)}
end

def zany_zip(*arrays)
    longest = arrays.map(&:length).max
    new_arrs = Array.new(longest){Array.new(arrays.length)}
    (0...arrays.length).each do |i| 
                arrays[i].each_with_index do |ele, j|
                    new_arrs[j][i] = ele
                end
    end
    new_arrs
end

def maximum(array, &blc)
    return nil if array.empty?
    hash = {}
    array.each {|ele| hash[ele] = blc.call(ele)}
    hash.sort_by{|k,v| v}[-1][0]
end

def my_group_by(array, &blc)
    hash = Hash.new{|h,k| h[k] = []}
    array.each {|ele| hash[blc.call(ele)] << ele }
    hash
end

def max_tie_breaker(array, prc, &blc)
    return nil if array.empty?
    largest = array[0]
    array[1..-1].each do |ele|
        case blc.call(largest) <=> blc.call(ele)
        when -1
            largest = ele
        when 0
            case prc.call(largest) <=> prc.call(ele)
            when -1
                largest = ele
            end
        end 
    end
    largest
end

def silly_syllables(sentence)
    sentence.split(" ").map {|word| vowel_indxs(word).length > 1 ? spliced(word) : word}.join(" ")
end

def spliced(word)
    first, last = vowel_indxs(word).first, vowel_indxs(word).last 
    word[first..last]
    
end

def vowel_indxs(word)
    indies = []
    word.each_char.with_index {|char, i| indies << i if "aeiou".include?(char.downcase)}
    indies 
end