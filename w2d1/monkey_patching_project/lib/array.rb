# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if empty?
    max - min
  end

  def average
    return nil if empty?
    sum / length.to_f
  end

  def median
    return nil if empty?
    if length.odd?
        return sort[length / 2] 
    else
        return [sort[length / 2], sort[length / 2 - 1]].average
    end
  end

  def counts
    counts = Hash.new(0)
    each {|ele| counts[ele] += 1}
    counts 
  end

  def my_count(value)
    counter = 0
    each {|ele| counter += 1 if value == ele}
    counter 
  end

  def my_index(value)
    each_with_index {|ele, i| return i if ele == value}
    nil
  end

  def my_uniq
    self & self
  end

    def my_transpose
        new_array = Array.new(length){Array.new}
        each do |array|
            array.each_with_index {|ele, i| new_array[i] << ele }
        end
        new_array
    end
end
