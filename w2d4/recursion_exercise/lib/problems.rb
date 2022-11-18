def pow(base, exponent)
    return 1 if exponent == 0
    base * pow(base, exponent-1)
end

def lucas_number(n)
    return 2 if n == 0
    return 1 if n == 1 
    lucas_number(n-1) + lucas_number(n-2)
end

def sum_array(array)
    return 0 if array.empty?
    array[0] + sum_array(array[1..-1])
end

def reverse_string(str)
    return str if str.length < 2
    str[-1] + reverse_string(str[0...-1])
end

def flatten(data)
    return [data] unless data.is_a?(Array)
    new_array = []
    # data.map {|array| flatten(array)}.flatten ...just kidding
    data.each {|array| new_array += flatten(array)}
    new_array
end