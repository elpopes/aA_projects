def largest_prime_factor(num)
    num.downto(2).each {|div| return div if num % div == 0 && is_prime?(div)}
end

def is_prime?(n)
    (2...n).none? {|d| n % d == 0}
end

def unique_chars?(string)
    string.each_char.with_index do |char_1, i|
        string.each_char.with_index do |char_2, j|
            if i < j
                return false if char_1 == char_2
            end
        end
    end
    true
end

def dupe_indices(array)
    dupes = Hash.new{|h,k| h[k] = []}
    array.each_with_index {|ele, i| dupes[ele] << i}
    dupes.filter {|k,v| v.length > 1}
end

def ana_array(array1, array2)
    tracker = Hash.new(0)
    array1.each {|ele| tracker[ele] += 1}
    array2.each {|ele| tracker[ele] -= 1}
    tracker.values.none?{|val| val != 0}

end