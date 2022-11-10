def proper_factors(num)
    (1...num).select {|fac| num % fac == 0}
end

def aliquot_sum(num)
    proper_factors(num).sum
end

def perfect_number?(num)
    num == aliquot_sum(num)
end

def ideal_numbers(num)
    ideal_numbers = [6]
    next_ideal = 27
    while true
        next_ideal += 1
        ideal_numbers << next_ideal if perfect_number?(next_ideal)
        return ideal_numbers if ideal_numbers.length == num
    end
end