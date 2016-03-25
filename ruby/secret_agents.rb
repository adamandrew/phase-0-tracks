#OUR METHOD DECLARATIONS
# Declare a length variable to tell the program when to stop running
# Make each letter in the string advance using .next
# Declare new_string variable to store all of the new letters 
# Return the new letters from new_string

def encrypt(string)
  length = string.length
  #add i for any index variables
  i = 0
  new_string = ""
    while i < length 
      #add if statement for edge case of "z"
      if string[i] == "z"
        new_string += "a"
      else new_string += string[i].next
      end
      i += 1
    end 
  return new_string
end 

#puts encrypt("abc")
#puts encrypt("zed")

#First use the whole alphabet as a string
#Next use the .index method on the alphabet to get all the indexes in the string
#Next we will find out the letter before by decreasing the current index by 1

def decrypt(string)
  x = string.downcase
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  i = 0 
  length =  x.length
  new_string = ""
    while i < length 
        #we tried to accommodate for the spaces with this if statement, 
        #however we still get an error
        if x[i] == " "
        new_string += " "
        else j = alphabet.index(x[i])
        new_string += alphabet[j-1]
        end 
      i += 1
    end 
  return new_string
end

#puts decrypt("bcd")
#puts decrypt("afe")
#getting secret_agents.rb:38:in `decrypt': undefined method `-' for nil:NilClass (NoMethodError)
  #from secret_agents.rb:48:in `<main>'
  #through testing, we figured out that our code gets broken when it encounters spaces
#puts decrypt(encrypt("The duck flies at midnight"))

#OUR DRIVER CODE

puts "Do you want to decrypt or encrypt a password?"
input = gets.chomp 

puts "What is the password?"
password = gets.chomp
  
  if input == "decrypt"
    puts "Your password has been successfully decrypted"
    puts decrypt(password)
  elsif input == "encrypt"
    puts "Your password has been successfully encrypted"
    puts encrypt(password)
  else puts "Please try again and write out encrypt or decrypt"
  end 