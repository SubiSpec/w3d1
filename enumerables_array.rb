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

        result = []

        self.my_each(&prc).each do |ele|
            #debugger
            if prc.call(ele)
                result << ele
            end
        end
        p result
    end

    def my_reject(&prc)

        result = []

        self.my_each(&prc).each do |ele|
            #debugger
            if !prc.call(ele)
                result << ele
            end
        end
        p result
    end


    def my_any?(&prc)
        # return true if self.any? { |ele| prc.call(ele) }
        self.each do |ele|
            if prc.call(ele)
                return true
            end
        end
        return false
    end

    def my_all?(&prc)
        self.each do |ele|
            if !prc.call(ele)
                return false
            end
        end
        return true
    end

    # def my_flatten

    #     return flat if self == []

    #     flat = []

    #     self.each do |ele|
    #         # debugger
    #         if ele.class != Array
    #            flat << ele
    #         else
    #             ele.my_flatten
    #         end
    #     end
    # end

    def my_zip(*arg)
        arr = []
            arg.each do |array|
               arr << array.length = 1
            end



end

# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]