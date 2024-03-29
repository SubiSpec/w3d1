require 'byebug'

class Array
    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end
        self
    end

    def my_select(&prc)
        els = []

        self.my_each do |el|
            els << el if prc.call(el) 
        end
        p els
    end

    def my_reject(&prc)
        excluded = []

        self.my_each do |el|
            excluded << el if !prc.call(el)
        end
        p excluded
    end

    def my_any?(&prc)
        self.my_each do |el|
            return true if prc.call(el)
        end
        false
    end

    def my_all?(&prc)
        self.my_each do |el|
            return false if !prc.call(el)
        end
        true
    end

    def my_flatten 
        return [] if self.empty? 
        one_d = []

        self.my_each do |el|
            if !el.is_a?(Array)
                one_d << el
            else
                one_d += el.my_flatten
            end
        end
        one_d
    end

    def my_zip(*args)
        els = []

        args.my_each do |arr|
            if self.length > arr.length
                arr << nil until arr.length == self.length
            end
        end

        self.each do |el|
            els << [el]
        end

        args.each do |arr|
            i = 0
            while i < self.length
                els[i] << arr[i]
                i += 1
            end
        end
        els
    end

    # def my_rotate(n = 1) 
    #     if n > 0 
    #         i = 0
    #         while i < n
    #             self.push(self.shift)
    #             i += 1
    #         end
    #     elsif n < 0
    #         i = 0
    #         while i >= n
    #             self.unshift(self.pop)
    #             i -= 1
    #         end
    #     end
    #     p self
    # end

    def my_rotate(pos = 1)
        split_idx = pos % self.length

        self.drop(split_idx) + self.take(split_idx)
    end

    def my_join(separator = '')
        joined = ''
        self.each do |el|
            joined += el + separator
        end
        p joined
    end

    def my_reverse
        reversed = []
        self.each do |el|
            reversed.unshift(el)
        end
        p reversed
    end

end


[ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
[ 1 ].my_reverse               #=> [1]

# a = [ "a", "b", "c", "d" ]
# a.my_join         # => "abcd"
# a.my_join("$")    # => "a$b$c$d"


# a = [ "a", "b", "c", "d" ]
# a.my_rotate         #=> ["b", "c", "d", "a"]
# a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# a.my_rotate(15)     #=> ["d", "a", "b", "c"]

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# # p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# # p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

# return_value = [1, 2, 3].my_each do |num|
#     puts num
#    end.my_each do |num|
#     puts num
#    end
#    # => 1
#    #    2
#    #    3
#    #    1
#    #    2
#    #    3
   
#    p return_value  # => [1, 2, 3]

# a = [1, 2, 3]
# a.my_select { |num| num > 1 } # => [2, 3]
# a.my_select { |num| num == 4 } # => []

# a = [1, 2, 3]
# a.my_reject { |num| num > 1 } # => [1]
# a.my_reject { |num| num == 4 } # => [1, 2, 3]

# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]
