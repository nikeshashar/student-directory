





def students
	[{:name=> ‘Enrique’, :cohort=>:June}]
end

def take_user_input(input = $stdin)
	input gets.chomp
end

def show(string)
	puts string
end

def print_header
	show "Welcome to Student Directory!\nPlease input something:"
end