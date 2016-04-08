class TodoList
	def initialize(array)
		@chores = array
	end

	def get_items
		@chores
	end

	def get_item(index)
		@chores[0]
	end

	def add_item(chore)
		@chores << chore
	end

	def delete_item(chore)
		@chores.delete(chore)
	end
end