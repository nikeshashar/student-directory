def input_students
	#creates an empty array
	students = []
	valid_months = {
		"june" => 6,
		"july" => 7,
		"september" => 9,
	}
loop do
	p "Please enter the names of the students"
	p "To finish just hit return twice"
	name = gets.chomp
	#cohort = ""
	break if name.empty?

	loop do
		p "What cohort are you in?"
		@cohort = gets.chomp || "june"
		break if valid_months[@cohort]
	end

	p "What is your hobby"
	hobby = gets.chomp
	p "What country were you born in?"
	origin = gets.chomp
	#add the details hash to the array
	students << {:name => name, :cohort => @cohort.to_sym, :hobby => hobby, :origin => origin}
	p "Now we have #{students.length} students with their details"
	#get another name from the user	
end
#return array of students with hobbies
students
end

def print_header
	p "The students of my cohort at Makers Academy with their hobbies"
	p "------------------------"
end

def print(students)
	count = 0
	while count < students.length do
	p "#{students[count][:name]} is in the #{students[count][:cohort]} cohort and enjoys #{students[count][:hobby]}. #{students[count][:name]} is from #{students[count][:origin]}.".center(100)
	count = count + 1
end
		
	# students.each do |student|
	# p "#{student[:name]} (#{student[:cohort]} cohort)" if student[:name].start_with?("A", "a") && student[:name].length < 12
	# end
end

def print_footer(names)
	p "Overall we have #{names.length} mighty students"
end
#nothing will happen until we do the last bit
students = input_students
print_header
print(students)
print_footer(students)

