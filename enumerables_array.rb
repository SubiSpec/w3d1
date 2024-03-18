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


end

a = [1, 2, 3]
p a.my_any? { |num| num > 1 } # => true
p a.my_any? { |num| num == 4 } # => false
p a.my_all? { |num| num > 1 } # => false
p a.my_all? { |num| num < 4 } # => true