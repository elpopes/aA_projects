# Reimplement the bubble sort outlined in the preceding lecture.
# The bubble_sort method should accept an array of numbers and arrange the elements in increasing order.
# The method should return the array.
# Do not use the built-in Array#sort

# def bubble_sort(array)
#     sorted = false
#     while sorted == false
#         sorted = true
#         array.each_with_index do |num, i|
#             unless array[i+1].nil?
#                j = i + 1
#                 if num > array[j]
#                     num, array[j] = array[j], num
#                     sorted = false
#                 end
#             end
#         end
#     end
#     array
# end

def bubble_sort(array)
    sorted = false
    while sorted == false
        sorted = true
        (0...array.size-1).each do |i|
            j = i+1
            if array[i] > array[j]
                array[i], array[j] = array[j], array[i]
                sorted = false
            end 
        end
    end
    array
end

p bubble_sort([2, 8, 5, 2, 6])      # => [2, 2, 5, 6, 8]
p bubble_sort([10, 8, 7, 1, 2, 3])  # => [1, 2, 3, 7, 8, 10]