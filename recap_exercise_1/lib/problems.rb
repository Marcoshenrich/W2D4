# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array. 
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]

def all_vowel_pairs(words)
    vowels = "AEIOUaeiou"
    resarr = []

    (words.length - 1).times.with_index do |i|
        counthash1 = Hash.new(0)
        word = words[i]
        word.each_char {|char| counthash1[char] += 1 if vowels.include?(char)}
        
        j = i + 1
        (words.length - i - 1).times do
            compareword = words[j]
            counthash2 = Hash.new(0)
            compareword.each_char {|char| counthash2[char] += 1 if vowels.include?(char)}
            combinedhash = counthash1.merge(counthash2)
            resarr << [word, compareword].join(" ") if combinedhash.keys.length == 5
            j += 1
        end
    end
    resarr
end


# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false

def composite?(num)
    return false if num < 2
    return true if (2...num).any? {|i| num % i == 0 }
    false
end

# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]

def find_bigrams(str, bigrams)
    resarr = Array.new(bigrams.length, nil)
    strarr = str.split("")

    i = 0
    while i < strarr.length
        j = 0
        while j < strarr.length
            j = i + 1
            char1 = strarr[i]
            char2 = strarr[j]
            bitest = [char1, char2].join("")

            if bigrams.include?(bitest)
                idx = bigrams.index(bitest)
                resarr[idx] = bigrams[idx]
            end
            i += 1
        end
    end
    resarr -= [nil]
    resarr
end

class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
        prc ||=  Proc.new { |k, v|  k == v }
        reshash = Hash.new

        self.each do |k, v|
            reshash[k] = v if prc.call(k,v)
        end

        reshash
    end
end

class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil)
        resarr = []
        i = 0
        while i < self.length
            j = i
            while j < self.length
                if length == nil
                    resarr << self[i..j] if self[i..j].length
                else
                    resarr << self[i..j] if self[i..j].length == length
                end

                j += 1
            end
            i += 1
        end
        resarr
    end

    def substrings(length = nil)
        resarr = []
        i = 0
        while i < self.length
            j = i
            while j < self.length
                if length
                    resarr << self[i..j] if self[i..j].length == length
                else
                    resarr << self[i..j] if self[i..j].length 
                end

                j += 1
            end
            i += 1
        end
        resarr
    end


    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
        alph = 'abcdefghijklmnopqrstuvwxyz'
        restr = ""

        self.each_char do |char|
            restr += alph[(alph.index(char) + num) % 26]           
        end

        restr
    end
end




    # "cats".substrings(2)  # => ["ca", "at", "ts"]

    # def substrings(word, length = nil)
    #     resarr = []
    #     i = 0
    #     while i < word.length
    #         j = i
    #         while j < word.length
    #             resarr << word[i..j]

    #             j += 1
    #         end
    #         i += 1
    #     end
    #     resarr
    # end

    # p substrings("cats")     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"