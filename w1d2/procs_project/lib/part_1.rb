def my_map(array, &blc)
    new_array = []
    array.each {|el| new_array << blc.call(el)}
    new_array
end

def my_select(array, &blc)
    new_array = []
    array.each {|el| new_array << el if blc.call(el)}
    new_array
end

def my_count(array, &blc)
    count = 0
    array.each {|el| count += 1 if blc.call(el) }
    count
end

def my_any?(array, &blc)
    array.each {|el| return true if blc.call(el)}
    false
end

def my_all?(array, &blc)
    array.each {|el| return false if !blc.call(el)}
    true
end

def my_none?(array, &blc)
    array.each {|el| return false if blc.call(el)}
    true
end












































# def my_map(array, &blc)
#     new_array = []
#     array.each {|ele| new_array << blc.call(ele)}
#     new_array
# end

# def my_select(array, &blc)
#     new_array = []
#     array.each {|ele| new_array << ele if blc.call(ele)}
#     new_array
# end

# def my_count(array, &blc)
#     count = 0
#     array.each {|ele| count += 1 if blc.call(ele)}
#     count
# end

# def my_any?(array, &blc)
#     count = 0
#     array.each {|ele| count += 1 if blc.call(ele)}
#     count > 0
# end

# def my_all?(array, &blc)
#     count = 0
#     array.each {|ele| count += 1 if blc.call(ele)}
#     count == array.size
# end

# def my_none?(array, &blc)
#     count = 0
#     array.each {|ele| count += 1 if blc.call(ele)}
#     count == 0
# end
