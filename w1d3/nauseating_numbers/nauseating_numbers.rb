require 'byebug'

def strange_sums(array)
    counter = 0
    array.each_with_index do |num, i|
        array.each_with_index {|num2, j| counter += 1 if i>j && num + num2 == 0}
    end
    counter
end
puts "strange_sums"
p strange_sums([2, -3, 3, 4, -2])     # 2
p strange_sums([42, 3, -1, -42])      # 1
p strange_sums([-5, 5])               # 1
p strange_sums([19, 6, -3, -20])      # 0
p strange_sums([9])                   # 0
puts

def pair_product(num_array, product)
    num_array.each_with_index do |num, i|
        num_array.each_with_index {|num2, j| return true if i>j && num * num2 == product}
    end
    return false
end

puts "pair_product"
p pair_product([4, 2, 5, 8], 16)    # true
p pair_product([8, 1, 9, 3], 8)     # true
p pair_product([3, 4], 12)          # true
p pair_product([3, 4, 6, 2, 5], 12) # true
p pair_product([4, 2, 5, 7], 16)    # false
p pair_product([8, 4, 9, 3], 8)     # false
p pair_product([3], 12)             # false
puts

def rampant_repeats(string, hash)
    new_string = ""
    string.each_char {|char| hash.include?(char) ? new_string += char * hash[char] : new_string += char }
    new_string
end

puts "rampant_repeats"
p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'
puts


def perfect_square(num)
    num.times do |i|
        return true if i * i == num
    end
    return false
end

puts "perfect square"
p perfect_square(1)     # true
p perfect_square(4)     # true
p perfect_square(64)    # true
p perfect_square(100)   # true
p perfect_square(169)   # true
p perfect_square(2)     # false
p perfect_square(40)    # false
p perfect_square(32)    # false
p perfect_square(50)    # false
puts

class Integer
    def is_prime?
        (2...self).none? {|div| self % div == 0} 
    end

    def divisors
        (1...self).count {|div| self % div == 0}
    end

    def all_factors
        (1..self).select {|fact| self % fact == 0}
    end


end

def anti_prime?(num) 
    (1...num).none? {|n| num.divisors < n.divisors}
end


puts "anti_prime?"
p anti_prime?(24)   # true
p anti_prime?(36)   # true
p anti_prime?(48)   # true
p anti_prime?(360)  # true
p anti_prime?(1260) # true
p anti_prime?(27)   # false
p anti_prime?(5)    # false
p anti_prime?(100)  # false
p anti_prime?(136)  # false
p anti_prime?(1024) # false
puts

def matrix_addition(mat_1, mat_2)
    new_mat = []
    new_array = []
    mat_1.each_with_index do |array_1, i|
        mat_2.each_with_index do |array_2, j|
            if i == j
                new_array << array_1[0] + array_2[0]
                new_array << array_1[1] + array_2[1]
                new_mat << new_array
                new_array = []
            end
        end
    end
    new_mat
end


puts "matric_addition"
matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]
puts



def mutual_factors(*numbers)
    return numbers[0].all_factors if numbers.length == 1
    first_factors = numbers.shift.all_factors
    intersecting_factors = []
    while numbers.length > 0
        intersecting_factors = first_factors & numbers.shift.all_factors
    end
    intersecting_factors
end

puts "mutual_factors"
p mutual_factors(50, 30)            # [1, 2, 5, 10]
p mutual_factors(50, 30, 45, 105)   # [1, 5]
p mutual_factors(8, 4)              # [1, 2, 4]
p mutual_factors(8, 4, 10)          # [1, 2]
p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
p mutual_factors(12, 24, 64)        # [1, 2, 4]
p mutual_factors(22, 44)            # [1, 2, 11, 22]
p mutual_factors(22, 44, 11)        # [1, 11]
p mutual_factors(7)                 # [1, 7]
p mutual_factors(7, 9)              # [1]
puts

def tribonacci_number(n)
    return 1 if n < 3
    return 2 if n == 3
    tribonacci_number(n-1) + tribonacci_number(n-2) + tribonacci_number(n-3)
end

puts "tribonacci_number"
p tribonacci_number(1)  # 1
p tribonacci_number(2)  # 1
p tribonacci_number(3)  # 2
p tribonacci_number(4)  # 4
p tribonacci_number(5)  # 7
p tribonacci_number(6)  # 13
p tribonacci_number(7)  # 24
p tribonacci_number(11) # 274
puts

def matrix_addition_reloaded(*matricks)
    return matricks if matricks.length == 1
    return nil if matricks[0].length != matricks[-1].length
    matricks.length == 2
    new_mat = []
    new_array = []
    matricks[0].each_with_index do |array_1, i|
        matricks[1].each_with_index do |array_2, j|
            if i == j
                new_array << array_1[0] + array_2[0]
                new_array << array_1[1] + array_2[1]
                new_mat << new_array
                new_array = []
            end
        end
    end
    if matricks.length == 2 
        return new_mat
    else
        new_mat[0][0] += matricks.last[0][0]
        new_mat[0][1] += matricks.last[0][1]
        new_mat[1][0] += matricks.last[1][0]
        new_mat[1][1] += matricks.last[1][1]
    end
    new_mat 
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil
puts


def row?(grid)
    grid.any? {|row| row.all? {|ele| ele == row[0]}}
end

def col?(grid)
    (0...grid.length).any? do |index|
        grid.all? do |row|
             grid[0][index] == row[index]
        end
    end
end

def squarocol?(grid)
    row?(grid) || col?(grid)
end

puts "squarocol?"

p squarocol?([
    [:a, :x , :d],
    [:b, :x , :e],
    [:c, :x , :f],
]) # true

p squarocol?([
    [:x, :y, :x],
    [:x, :z, :x],
    [:o, :o, :o],
]) # true

p squarocol?([
    [:o, :x , :o],
    [:x, :o , :x],
    [:o, :x , :o],
]) # false

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 7],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # true

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 0],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # false
puts


def squaragonal?(grid)
    mark = grid[0][0]
    return true if grid.length == (0...grid.length).count {|i| mark == grid[i][i]}

    mark = grid[0][-1]
    return true if grid.length == (0...grid.length).count {|i| mark == grid[i][grid.length - 1 - i]}
    return false
end


puts "squaragonal?"
p squaragonal?([
    [:x, :y, :o],
    [:x, :x, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [:x, :y, :o],
    [:x, :o, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [1, 2, 2, 7],
    [1, 1, 6, 7],
    [0, 5, 1, 7],
    [4, 2, 9, 1],
]) # true

p squaragonal?([
    [1, 2, 2, 5],
    [1, 6, 5, 0],
    [0, 2, 2, 7],
    [5, 2, 9, 7],
]) # false
puts


def pascals_triangle(num)
    trig = [[1]]
    while trig.length < num
        trig << [1] + adj_sums(trig.last) + [1]
    end
    trig 
end

def adj_sums(array)
    sums_array = []
    array.each_with_index do |num, i|
        unless array[i + 1].nil?
            sums_array << num + array[i+1]
        end     
    end
    sums_array
end

puts "pascals_triangle"
p pascals_triangle(5)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1]
# ]

p pascals_triangle(7)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1],
#     [1, 5, 10, 10, 5, 1],
#     [1, 6, 15, 20, 15, 6, 1]
# ]
puts




def potmo?(num)
    pot = 1
    while pot < num
        pot *= 2
        return true if pot - 1 == num
    end
    false
end

def mersenne_prime(num)
    array = []
    counter = 3
    while array.length < num
        if counter.is_prime? && potmo?(counter)
            array << counter
        end
        counter += 1 
    end
    array[num-1]
end

puts "mersenne_prime"
p mersenne_prime(1) # 3
p mersenne_prime(2) # 7
p mersenne_prime(3) # 31
p mersenne_prime(4) # 127
# p mersenne_prime(6) # 131071
puts


def triangular_word?(word)
    triangular_num?(encoded(word))
end

def encoded(word)
    alpha = ("a".."z").to_a
    code = 0
    word.each_char{|char| code += alpha.index(char)+1}
    code
end

def triangular_num?(num)
    i = 0
    while i < num
        i += 1     
        return true if (i * (i+1))/2 == num
    end
    return false
end

puts "triangular_word?"
p triangular_word?('abc')       # true
p triangular_word?('ba')        # true
p triangular_word?('lovely')    # true
p triangular_word?('question')  # true
p triangular_word?('aa')        # false
p triangular_word?('cd')        # false
p triangular_word?('cat')       # false
p triangular_word?('sink')      # false
puts


def collapse(nums)
    (0...nums.length - 1).each do |i|
        if nums[i] + 1 == nums[i+1] || nums[i] - 1 == nums[i + 1]
            return nums[0...i] + nums[i + 2..-1]
        end
    end
    nums
end

def consecutive_collapse(numbers) 
    numbers.length-1.times {numbers = collapse(numbers)}
    numbers
end


puts "consecutive_collapse"
p consecutive_collapse([3, 4, 1])                     # [1]
p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
p consecutive_collapse([9, 8, 2])                     # [2]
p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
p consecutive_collapse([13, 11, 12, 12])              # []
puts 


def next_prime(num, n)
    prime_array = []
    if n > 0 
        while prime_array.length < n do 
            num += 1
            prime_array << num if num.is_prime?
        end
    else
        while prime_array.length < (n * -1) do 
            num -= 1
            if num.is_prime? && num > 1 
                prime_array << num
            elsif num.is_prime? && num < 2
                prime_array << nil
            end 
        end
    end
    prime_array.last
end

def pretentious_primes(array, n)
    array.map {|num| next_prime(num, n)}
end


puts "pretentious_primes"
p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]