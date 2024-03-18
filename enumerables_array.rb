class Array
    def my_each(&prc)
        self.map { |ele| prc.call(ele) }
    end

    def my_select(&prc)

        result = []

        self.my_each(prc).each do |ele|
            if prc.call(ele)
                result << ele
            end
        end
    end

end

return_value = [1, 2, 3].my_each do |num|
    puts num
   end.my_each do |num|
    puts num
   end
   # => 1
   #    2
   #    3
   #    1
   #    2
   #    3
   
   p return_value  # => [1, 2, 3]


# a = [1, 2, 3]
# a.my_select { |num| num > 1 } # => [2, 3]
# a.my_select { |num| num == 4 } # => []