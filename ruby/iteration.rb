# release 0
def block 
    puts "expirimenting with blocks"
    yield("block1", "block2")
end

block {|block1, block2| puts "still expirimenting with #{block1} and #{block2}"}

# release 1
fruit = { "apple" => "red", "banana" => "yellow", "pear" => "green"}

fruits = ["apple", "banana", "pear"]

fruit.each do |fruit, color|
    puts " #{fruit} is #{color}"
end

fruits.map! do |fruits|
    puts fruits
    fruits.upcase
end

# release 2
number = [1, 2, 3, 4, 5, 6, 7, 8]
hash_number = {
	1 => "one",
	2 => "two",
	3 => "three",
	4 => "four",
	5 => "five",
	6 => "six",
	7 => "seven",
	8 => "eight",
}

# method that deletes number less than 5
# p number.delete_if {|n| n < 5}

# p hash_number.delete_if {|key,value| key < 5}

# method that keeps number less than 5
# p number.keep_if {|n| n < 5}
# p hash_number.keep_if {|key,value| key < 5}

# another method that filters array/hash when condition is met
# p number.select {|n| n.odd?}
# p hash_number.select {|key,value| key.odd?}

# method that removes item until condition evaluates false
p number.drop_while {|n| n < 5}
p hash_number.drop_while {|key,value| key < 5}