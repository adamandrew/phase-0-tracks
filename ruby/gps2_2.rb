# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# container: initialize hash, data: items
# steps: 
  # place data into container
  # set default quantity to 0
  # print the list to the console [can you use one of your other methods here?]
# output: hash (key: item; value: qty)

# Method to add an item to a list
# input: item name and optional quantity, hash to add to
# steps: add pair of data to hash key:item, value:qty
# output: hash updated with new item

# Method to remove an item from the list
# input: item, hash to remove from
# steps: delete item from hash
# output: hash updated with item removed

# Method to update the quantity of an item
# input: item, hash it is in, new qty
# steps: change qty to new qty
# output: hash updated with new qty

# Method to print a list and make it look pretty
# input: hash to print
# steps: iterate through the hash for EACH value
# output: context: qty of item on grocery list

#global variables are scurry, spooky scurry variables

def grocerylist(items)
  itemhash = {}
  items.split(" ").each do |items|
    itemhash[items] = 0 
  end
  # p itemhash
  return itemhash
end

def additem(itemname, grocerylist, newqty = 0)
  grocerylist[itemname] = newqty
  return grocerylist
end

def removeitem(itemname, grocerylist)
  # p grocerylist.length
  grocerylist.delete(itemname)
  return grocerylist
end

def updateqty(itemname, grocerylist, newqty)
  grocerylist[itemname] = newqty
  return grocerylist
end

def printlist(grocerylist)
  grocerylist.each do |item, qty|
    puts "We need #{qty} #{item}."
  end
end

# test_list = grocerylist("item1 item2 item3")
# p test_list.keys.length == 3
# test_list = additem("newitem", test_list)
# p test_list
# p test_list["newitem"] == 1
# test_list = removeitem("newitem", test_list)
# p test_list.length

# updateqty("item1", test_list, 2)
# p test_list["item1"] == 2

# printlist(test_list)
#p test_list["newitem"]
#output = function_to_write(input)
#
#p outout.property == something_we_expect

grocery = grocerylist("lemonade tomato onion ice_cream")
updateqty("lemonade", grocery, 2)
updateqty("tomato", grocery, 3)
updateqty("onion", grocery, 1)
updateqty("ice_cream", grocery, 4)
removeitem("lemonade", grocery)
printlist(grocery)

# GPS2.2 Reflection
=begin
- I learned that it is easier to code if you specify the input and out put of a method in pseudocode first.
- We need to assign a quantity to each item so it is better to use a hash with key as the item and quantity as the value.
- A method returns the last line of code that is evaluated in its body.
- We can pass anything to a method.
- You can pass information between methods by passing them as parameters.
- The concept of testing the method were solidified, and I feel confident in all the concepts.
=end