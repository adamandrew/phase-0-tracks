# Method takes 3 parameters, and returns an array.

def build_array(p1,p2,p3)
	new_array = []
	new_array << p1
	new_array << p2
	new_array << p3
	return new_array
end 
# p build_array(1,"two",nil)
def add_to_array(arr,p)
	arr << p
end
p add_to_array([],"a")
p add_to_array(["a","b","c",1,2],3)

# empty_array = ["joy", "adam", "lee", "tom", "joe"]
# empty_array.delete_at(2)
# empty_array.insert(2, "paul")
# empty_array.shift
# empty_array.include? "joe"
# puts empty_array
# puts "Does this include the name joe? #{empty_array.include? "joe"}."
# next_array = ["cat", "dog", "bird", "hamster", "gerbil"]
# p new_variable = empty_array + next_array
