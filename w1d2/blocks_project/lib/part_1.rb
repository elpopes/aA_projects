def select_even_nums(nums_array)
    nums_array.select(&:even?)
end

def reject_puppies(arr_of_dogs)
    arr_of_dogs.reject {|hash| hash["age"] < 3}
end

def count_positive_subarrays(arrs_arr)
    arrs_arr.count {|arr| arr.sum > 0}
end

def aba_translate(string)
    string.split("").map {|char| 'aeiou'.include?(char) ? char + "b" + char : char}.join("")
end

def aba_array(array)
    array.map {|word| aba_translate(word)}
end

