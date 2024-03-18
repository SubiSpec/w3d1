class Array
    def my_each(&prc)
        self.map { |ele| prc.call(ele) }
    end
end

return_value = [1, 2, 3].my_each do |num|
    puts num
end
self.my_each do |num|
    puts num
end
   # => 1
   #    2
   #    3
   #    1
   #    2
   #    3
   
p return_value  # => [1, 2, 3]