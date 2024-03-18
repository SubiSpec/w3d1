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

    def my_flatten

        if self == []

        flat = []

        self.each do |ele|
            if ele.class != Array
               flat << ele
               self.delete(ele)
            else
                self.my_flatten
            end
        end
        flat
    end

end

p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]