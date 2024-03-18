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

        self.each do |ele|
            if prc.call(ele)
                 true
            end
        end
        return false
    end

end

a = [1, 2, 3]
a.my_any? { |num| num > 1 } # => true
a.my_any? { |num| num == 4 } # => false
# a.my_all? { |num| num > 1 } # => false
# a.my_all? { |num| num < 4 } # => true