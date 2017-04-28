class Project
	attr_accessor :name, :description, :owner

	def initialize name, description, owner
		@name = name
		@description = description
		@owner = owner
		@tasks = []
	end

	def elevator_pitch
		print "#{@name} , #{@description}"  
	end

	def task
		return @tasks
	end
	def add_tasks task
		@tasks.push( task )
	end
	def print_tasks
		@tasks.each do |task|
			puts task
		end
	end

end

