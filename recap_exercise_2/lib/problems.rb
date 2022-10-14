require "byebug"
# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    i = 1
    ansarr = []
    bignum = [num_1, num_2].max
    smallnum = [num_1, num_2].min

    while true
        prod1 = i * bignum
        prod2 = i * smallnum
        ansarr << prod1
        return prod2 if ansarr.include?(prod2)
        i += 1
    end
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    counthash = Hash.new(0)
    i = 0
    while i < str.length - 1
        j = i + 1
        bigram = str[i] + str[j]
        counthash[bigram] += 1
        i += 1
    end

    highnumidx = counthash.values.index(counthash.values.max)
    counthash.keys[highnumidx]
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        reshash = Hash.new
        self.each {|k,v| reshash[v] = k}
        reshash
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        count = 0
        i = 0
        while i < self.length - 1
            j = i + 1
            while j < self.length
                sum = self[i] + self[j]
                count += 1 if sum == num
                j += 1
            end
            i += 1
        end
        count
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        prc ||= Proc.new { |a,b| a <=> b }

        sorted = false
        while sorted == false
            i = 0
            sorted = true
    
            while i < self.length - 1
                j = i + 1

                if prc.call(self[i], self[j]) == 1
                    self[j], self[i] = self[i], self[j]
                    sorted = false
                end
                i += 1
            end
        end
        self

    end

end



