
def is_prime?(num)
    return false if num < 2
    (2...num).none? {|div| num % div == 0}
end

class Array
    def add_prime
        next_prime = self[-1] + 1 
        if is_prime?(next_prime)
            return self.push(next_prime)
        else   
            until is_prime?(next_prime)
                next_prime += 1
                if is_prime?(next_prime)
                    return self.push(next_prime)
                else
                    next_prime += 1   
                end
            end
        end
    end
end

def nth_prime(num)
    primes = [2] 
    while primes.length < num
        primes.add_prime
    end
    primes[num-1]
end

def prime_range(min, max)
    primes = [2]
    until primes[-1] > max
        primes.add_prime
    end
    primes.select {|ele| ele >= min && ele <= max}
end