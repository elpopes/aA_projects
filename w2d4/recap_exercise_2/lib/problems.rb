def least_common_multiple(num_1, num_2)
    (1..num_1 * num_2).select {|num| num % num_1 == 0 && num % num_2 == 0}.min
end

def most_frequent_bigram(str)
    char_pairs(str).max_by {|pair| char_pairs(str).count(pair)}
end

def char_pairs(str)
    str.split("")[0...-1].map.with_index{|char, i| char + str[i+1]}
end

class Hash
    def inverse
        switched = {}
        each {|k,v| switched[v] = k}
        switched
    end
end


class Array
  
    def pair_sum_count(num)
        all_subs.count {|arrs| arrs.first + arrs.last == num }
    end

    def all_subs
        map.with_index do |num, i| 
            map.with_index do |num2, j| 
                if i < j
                    [num, num2]
                end
            end.compact
        end.flatten(1)
    end

    def bubble_sort(&prc)
        prc ||= Proc.new {|a,b| a <=> b}
        sorted = false
        while !sorted 
            sorted = true
            each_with_index do |ele, i|
                if i + 1 < length
                    j = i+1
                    if prc.call(ele, self[j]) == 1    
                        self[i], self[i+1] = self[i+1], self[i]
                        sorted = false
                    end
                end
            end
        end
        self
    end
end
