# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
    zipped = ''
    counter = 1
    last_char = str[0]
        (1..str.length).each do |i|
            if str[i] == last_char
                counter += 1
            else 
                zipped << counter.to_s if counter > 1
                zipped << last_char
                last_char = str[i]
                counter = 1
            end
        end
    zipped
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
