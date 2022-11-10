def element_count(array)
    counter = Hash.new(0)
    array.each {|ele| counter[ele] += 1}
    counter
end

def char_replace!(string, hash) 
    string.each_char.with_index {|char, i| string[i] = hash[char] if hash.has_key?(char)}
    string
end

def product_inject(array)
    array.inject {|acc, num| acc * num} 
end