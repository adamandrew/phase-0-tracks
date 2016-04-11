# module Shout
#   def self.yell_angrily(words)
#     words + "!!!" + " :("
#   end

#   def self.yell_happily(words)
#     words + "!!!" + " :)"
#   end
# end

# puts Shout.yell_angrily("Hello world")
# puts Shout.yell_happily("Hello world")

# Mixin version of Shout module
module Shout
	def yell_angrily(words)
		words + "!!!" + " :("
	end

	def yell_happily(words)
		words + "!!!" + " :)"
	end
end

class Man
	include Shout
end

class Woman
	include Shout
end

man = Man.new
puts man.yell_happily("Hello world")
puts man.yell_angrily("Hello world")

woman = Woman.new
puts woman.yell_happily("Hello world")
puts woman.yell_angrily("Hello world")