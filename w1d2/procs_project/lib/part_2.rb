def reverser(str, &blc)
    blc.call(str.reverse)
end

def word_changer(sentence, &blc)
    words = sentence.split(" ")
    words.map {|word| blc.call(word)}.join(" ")
end

def greater_proc_value(num, proc_1, proc_2)
    proc_1.call(num) > proc_2.call(num) ? proc_1.call(num) : proc_2.call(num)
end

def and_selector(array, proc_1, proc_2)
    array.select {|ele| proc_1.call(ele) && proc_2.call(ele)}
end

def alternating_mapper(array, proc_1, proc_2)
    array.map.with_index {|ele, i| i.even? ? proc_1.call(ele) : proc_2.call(ele)}
end