require "date"
@students = []

def input_students
	while true 
		name = enter_name
		if name.empty?
			break 
		end
			cohort = check_cohort
			hobby = check_hobby
			origin = check_origin
			@students << {:name => name, :cohort => cohort, :hobby => hobby, :origin => origin}
			p "Now we have #{@students.length} #{pluralise('student', @students.length)} with their details"
			puts ""
	end
	@students
end

def enter_name
	p "Please enter the student name or press Enter twice to return to menu"
	STDIN.gets.chomp.capitalize
end

def check_cohort
	loop do
		p "What cohort are you in?"
		@cohort = STDIN.gets.chomp 
		break if Date.parse(@cohort) rescue nil
	end
	Date.parse(@cohort).strftime(format="%B")
end

def check_hobby
	p "What is your hobby"
	STDIN.gets.chomp	
end

def check_origin
	p "What country were you born in?"
	STDIN.gets.chomp	
end

def print_header
	p "The #{pluralise('student', @students.length)} of my cohort at Makers Academy with their hobbies"
	p "------------------------"
end

def print_students_list
	@students.sort_by!{|student| Date.parse(student[:cohort].to_s)} 
	@students.each do |student| 
		p "#{student[:name]} is in the #{student[:cohort]} cohort and enjoys #{student[:hobby]}. #{student[:name]} is from #{student[:origin]}."
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

