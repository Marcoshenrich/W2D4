require "byebug"

def no_dupes?(arr)
    counthash = Hash.new(0)
    arr.each {|el| counthash[el] += 1}
    resarr = []
    counthash.each {|k,v| resarr << k if v == 1}
    resarr
end


# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []


def no_consecutive_repeats?(arr)
    i = 0
    while i < arr.length - 1
        j = i + 1
        return false if arr[i] == arr[j]
        i += 1
    end

    true
end


# # Examples
# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
    indhash = Hash.new {|h,k| h[k] = []}

    str.each_char.with_index do |char, i|
        indhash[char] << i
    end

    indhash
end

# Examples
char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}


# def longest_streak(str)
#     longst = ""
#     curstr = str[0]

#     i = 0
#     while i < str.length
#         char = str[i]
#         nex = str[i + 1] 

#         if nex == char
#             curstr += nex
#         elsif char != nex && curstr.length > longst.length
#             longst = curstr
#             curstr = nex
#         end

#         i += 1
#     end

#     longst
# end

# # Examples
# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'



def isprime?(num)
    return false if num < 2
    return false if (2...num).any? {|i| num % i == 0}
    true
end

def primearr(num)
    primearr = []
    (2..num).each {|i| primearr << i if isprime?(i)}
    primearr
end

def bi_prime?(num)
    primearr = primearr(num/2)

    primearr.each do |primenum1|
        primearr.each do |primenum2|
            return true if num == primenum1 * primenum2
        end
    end
    false
end

# # Examples
# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false


def vigenere_cipher(str, seqarr)
    alph = "abcdefghijklmnopqrstuvwxyz"
    seqcount = 0
    restr = ""

    str.each_char do |char|
        seq = seqarr[seqcount % seqarr.length]
        seqcount += 1
        restr += alph[(alph.index(char) + seq) % 26]
    end
    restr
end


# Examples
# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vowelarrmaker(str)
    vowels = "aeiou"
    vowelarr = []
    str.each_char {|char| vowelarr << char if vowels.include?(char) }
    vowelarr
end


def vowel_rotate(str)
    vowels = "aeiou"
    vowelarr = vowelarrmaker(str)
    vowelidxseq = -1
    restr = ""

    str.each_char do |char|
        if vowels.include?(char)
            restr += vowelarr[vowelidxseq]
            vowelidxseq += 1
        else
            restr += char
        end
    end
    restr
end


# # Examples
# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"



class String#select

    def select(&prc)
        prc ||= Proc.new {|ele| false }
        resstr = ""
        self.each_char { |ele| resstr += ele if prc.call(ele) }
        resstr
    end

end


# # Examples
# p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# p "HELLOworld".select          # => ""



class String#map!

    def map!(&prc)
        self.each_char.with_index do |char, i|
            self[i] = prc.call(char, i)
        end
        self
    end

end


# # Examples
# word_1 = "Lovelace"
# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        # => "Lov3l4c3"

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        # => "DiJkStRa"



# def multiply(base, multiplier)
#     return 0 if multiplier == 0 || base == 0
#     # # return base if multiplier == 1 || multiplier == -1
#     # # multiplier > 0 ? multiplier -= 1 : multiplier += 1
#     # # base + multiply(base, multiplier)

#     # if base < 0 && multiplier > 0
#     #     multiplier -= 1
#     #     return base + multiply(base, multiplier)

#     # elsif base > 0 && multiplier < 0
#     #     multiplier += 1
#     #     return -base - multiply(base, multiplier)
#     # else
#     #     multiplier > 0 ? multiplier -= 1 : multiplier += 1
#     #     return base.abs + multiply(base, multiplier).abs
#     # end
# end

# def multiply(base, multiplier)
#     return 0 if multiplier == 0 || base == 0
#     mdirection = 0 <=> multiplier
#     bdirection = 0 <=> base

#     multiplier += 1 * mdirection
#     if base > 0
#         base + multiply(base, multiplier) * mdirection
#     else
#         base - multiply(base, multiplier) * mdirection
#     end


# end

def multiply(base, multiplier)
    return 0 if multiplier == 0 || base == 0

    if multiplier > 0
        base + multiply(base, multiplier - 1)
    else
        -base + multiply(base, multiplier + 1)
    end

end

# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(10, 0)       # => 0
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18
# p multiply(-3, 6)       # => -18


# def lucas_sequence(num)
#     case num
#     when 0
#         return []
#     when 1
#         return [2]
#     when 2
#         return [2, 1]
#     end

#     arr = []
#     arr.concat(lucas_sequence(num - 1))
#     arr.concat([lucas_sequence(num - 1)[-1] + lucas_sequence(num - 1)[-2]])   
#     arr
# end


# p lucas_sequence(0)   # => []
# p lucas_sequence(1)   # => [2]    
# p lucas_sequence(2)   # => [2, 1]
# p lucas_sequence(3)   # => [2, 1, 3]
# p lucas_sequence(4)   # => [2, 1, 3, 4]
# p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

def isprime?(num)
    return false if num < 2
    return false if (2...num).any? {|i| num % i == 0}
    true
end

def primearr(num)
    primearr = []
    (2..num).each {|i| primearr << i if isprime?(i)}
    primearr
end


def prime_factorization(num, arr=[])
    return arr if arr.inject(:*) == num

    primearr = primearr(num)


    primearr.each do |prime|  
        return arr.concat([prime]) if prime * arr.inject(:*) == num
    end

    i = 0
    while i < arr.length
        primemult = primearr[i]
        i += 1
    end
    #num 1, go up to all primes in primearr and check against prod
    #num 2, go up to all primes in primearr and check against prod

    arr.concat([2]) # <- I can concat 2, I just need to add to it in my multiplication step
    prime_factorization(num, arr)

end

p primearr(25)


# p prime_factorization(2)     # => [2]
# p prime_factorization(3)     # => [3]
# p prime_factorization(4)     # => [2, 2]
# p prime_factorization(5)     # => [5]
# p prime_factorization(6)     # => [2, 3]
# p prime_factorization(12)     # => [2, 2, 3]
# p prime_factorization(24)     # => [2, 2, 2, 3]
# p prime_factorization(25)     # => [5, 5]
# p prime_factorization(60)     # => [2, 2, 3, 5]
# p prime_factorization(7)      # => [7]
# p prime_factorization(11)     # => [11]
# p prime_factorization(2017)   # => [2017]


# arr = []
# prod = arr.inject(:*)
# p prod