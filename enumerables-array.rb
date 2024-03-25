class Array
  def my_each(&prc)

    self.length.times do |i|
      prc.call(self[i])
    end

    self
  end

  
  # Now extend the Array class to include my_select that takes a block and returns a new array containing only elements that satisfy the block. Use your my_each method!

  def my_select(&prc)
    arr = []

    self.my_each do |el|
      arr << el if prc.call(el)
    end

    return arr

  end

  
  # Write my_any? to return true if any elements of the array satisfy the block

  def my_any?(&prc)

    self.my_each do |el|
      return true if prc.call(el)
    end

    return false

  end

  
  # my_flatten should return all elements of the array into a new, one-dimensional array. Hint: use recursion!

  def my_flatten
    holder = []

    self.my_each do |el|
      if el.is_a?(Array)
        holder << el.my_flatten
      else
        holder << el
      end
    end


    return holder
  end

  
  # Write my_zip to take any number of arguments. It should return a new array containing self.length elements. Each element of the new array should be an array with a length of the input arguments + 1 and contain the merged elements at that index. If the size of any argument is less than self, nil is returned for that location.

  def my_zip(*arrays)
    holder = []

    self.my_each do |el|
      holder << [el]
    end

    arrays.my_each do |array|
      holder.each_with_index do |subarray, idx|
        subarray << array[idx]
      end
    end

    return holder
  end

end








if __FILE__ == $PROGRAM_NAME

  array1 = [1,2,3,4,5,6]
  array2 = ["a", "b", "c", "d", "e",]
  array3 = [10, [100, [1000, 10000]]]

  p array1.my_select{ |el| el > 3 } # [4,5,6]
  p array1.my_any?{|el| el == 8 } # false
  p array3.my_flatten # [10, 100, 1000, 10000]
  p array1.my_zip(array2, array3) # [[1, "a", 10], [2, "b", [100, [1000, 10000]]], [3, "c", nil], [4, "d", nil], [5, "e", nil], [6, nil, nil], [7, nil, nil]]
end
