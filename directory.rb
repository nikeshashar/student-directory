require "date"
@students = []
def input_students
	#creates an empty array
	# students = []
loop do
	p "Please enter the names of the students"
	p "To finish just hit return twice"
	name = gets.gsub(/\n/, "")
	#cohort = ""
	break if name.empty?

	loop do
		p "What cohort are you in?"
		@cohort = gets.gsub(/\n/, "")|| "june"
		break if Date.parse(@cohort) rescue nil
	end

	p "What is your hobby"
	hobby = gets.gsub(/\n/, "")
	p "What country were you born in?"
	origin = gets.gsub(/\n/, "")
	#add the details hash to the array
	@students << {:name => name, :cohort => Date.parse(@cohort).strftime(format="%B").to_sym, :hobby => hobby, :origin => origin}
	p "Now we have #{@students.length} #{pluralise('student', @students.length)} with their details"
	puts ""
	#get another name from the user	
end
#return array of students with hobbies
@students
end

def print_header
	p "The #{pluralise('student', @students.length)} of my cohort at Makers Academy with their hobbies"
	p "------------------------"
end

def print_students_list
	@students.sort_by!{|student| Date.parse(student[:cohort].to_s)} 
	
	count = 0
	while count < @students.length do
		p "#{@students[count][:name]} is in the #{@students[count][:cohort]} cohort and enjoys #{@students[count][:hobby]}. #{@students[count][:name]} is from #{@students[count][:origin]}."
	count = count + 1 
	end
end
	
	# students.each do |student|
	# p "#{student[:name]} (#{student[:cohort]} cohort)" if student[:name].start_with?("A", "a") && student[:name].length < 12
	# end
 

def print_footer
	p "Overall we have #{@students.length} mighty #{pluralise('student', @students.length)}"
	puts ""
end

# def sort_by_cohort(students)
# 	students.sort_by!{|student| Date.parse(student[:cohort].to_s)}
# end	

def pluralise(word, count)
	if count == 1
		return word
	else 
		return word + "s"
	end	
end

def print_menu
	# 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
	if @students.length != 0
		print_header
		print_students_list
		print_footer
	else
		puts "No students to show. Please input some students"
		puts ""
	end	
end
def process(selection)
	case selection
		when "1"
			input_students
		when "2"
			show_students
		when "9"
			exit # this will cause the program to terminate
		else 
			puts "Try again bud!"
	end	
end

def interactive_menu
	loop do
	print_menu
    process(gets.chomp)
    puts ""
	end
end

interactive_menu

#nothing will happen until we do the last bit
# students = input_students
# if !(students.empty?)
# 	print_header(students)
# 	# sort_by_cohort(students)
# 	print(students)
# 	print_footer(students)
# else
# 	puts "you got no friends bro"
# end

