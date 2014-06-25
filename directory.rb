require "date"
def input_students
	#creates an empty array
	students = []
loop do
	p "Please enter the names of the students"
	p "To finish just hit return twice"
	name = gets.chomp
	#cohort = ""
	break if name.empty?

	loop do
		p "What cohort are you in?"
		@cohort = gets.chomp || "june"
		break if Date.parse(@cohort) rescue nil
	end

	p "What is your hobby"
	hobby = gets.chomp
	p "What country were you born in?"
	origin = gets.chomp
	#add the details hash to the array
	students << {:name => name, :cohort => Date.parse(@cohort).strftime(format="%B").to_sym, :hobby => hobby, :origin => origin}
	p "Now we have #{students.length} #{pluralise('student', students.length)} with their details"
	#get another name from the user	
end
#return array of students with hobbies
students
end

def print_header(students)
	p "The #{pluralise('student', students.length)} of my cohort at Makers Academy with their hobbies"
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
	p "Overall we have #{names.length} mighty #{pluralise('student', names.length)}"
end

def sort_by_cohort(students)
	students.sort_by!{|student| Date.parse(student[:cohort].to_s)}

end	

def pluralise(word, count)
	if count == 1
		return word
	else 
		return word + "s"
	end	
end
#nothing will happen until we do the last bit
students = input_students
print_header(students)
sort_by_cohort(students)
print(students)
print_footer(students)

