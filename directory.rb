
require "date"
@students = []
def input_students
loop do
	p "Please enter the names of the students"
	p "To finish just hit return twice"
	name = STDIN.gets.gsub(/\n/, "")
	break if name.empty?

	loop do
		p "What cohort are you in?"
		@cohort = STDIN.gets.gsub(/\n/, "")|| "june"
		break if Date.parse(@cohort) rescue nil
	end

	p "What is your hobby"
	hobby = STDIN.gets.gsub(/\n/, "")
	p "What country were you born in?"
	origin = STDIN.gets.gsub(/\n/, "")
	@students << {:name => name, :cohort => Date.parse(@cohort).strftime(format="%B").to_sym, :hobby => hobby, :origin => origin}
	p "Now we have #{@students.length} #{pluralise('student', @students.length)} with their details"
	puts ""
	
end
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

def print_footer
	p "Overall we have #{@students.length} mighty #{pluralise('student', @students.length)}"
	puts ""
end

def pluralise(word, count)
	if count == 1
		return word
	else 
		return word + "s"
	end	
end

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "4. Load students from file"
    puts "9. Exit"
end

def save_students
	file = File.open("students.csv", "w")
	@students.each do |student|
		student_data = [student[:name], student[:cohort], student[:hobby],student[:origin]]
		csv_line = student_data.join(",")
		file.puts csv_line
	end
	file.close
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

def load_students (filename="students.csv")
	file=File.open(filename,"r")
	file.readlines.each do |line|
		name, cohort, hobby, origin = line.chomp.split(',')
		@students << {:name => name,:cohort => cohort.to_sym, :hobby => hobby, :origin => origin}
	end
	file.close
end

def try_load_students 
	filename = ARGV.first
	return load_students if filename.nil?
	if File.exists?(filename)
		load_students(filename)
		puts "Loaded #{@students.length} from #{filename}"
	else
		puts "Sorry, #{filename} doesn't exist"
		exit
	end
end

def process(selection)
	case selection
		when "1"
			input_students
		when "2"
			show_students
		when "3"
			save_students
		when "4"
			try_load_students
		when "9"
			exit
		else 
			puts "Try again bud!"
	end	
end

def interactive_menu
	loop do
	print_menu
    process(STDIN.gets.chomp)
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

	
# students.each do |student|
# p "#{student[:name]} (#{student[:cohort]} cohort)" if student[:name].start_with?("A", "a") && student[:name].length < 12
# end
 
# def sort_by_cohort(students)
# 	students.sort_by!{|student| Date.parse(student[:cohort].to_s)}
# end	
