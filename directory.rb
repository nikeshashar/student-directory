#cleaning puts using array
students = [
 {:name => "Dave Hole in One", :cohort => :june},
 {:name => "Eddie the Clamberer", :cohort => :june},
 {:name => "Catharina Rover", :cohort => :june},
 {:name => "Igor the Melodic", :cohort => :june},
 {:name => "Marco the Bro", :cohort => :june},
 {:name => "Lisa Waterbaby", :cohort => :june},
 {:name => "Michiel all ears", :cohort => :june},
 {:name => "Jean Big Screen", :cohort => :june},
 {:name => "Nicola Roadrunner", :cohort => :june},
 {:name => "Jennie the Wanderer", :cohort => :june},
 {:name => "Iona VoiceBox", :cohort => :june},
 {:name => "Nikesh Jammin Chilli", :cohort => :june},
 {:name => "Chole bendy", :cohort => :june},
 {:name => "Toan Ice Cool", :cohort => :june},
 {:name => "Jamie Uniball", :cohort => :june},
 {:name => "Peter Hoy", :cohort => :june},
 {:name => "Talal Olympian", :cohort => :june},
 {:name => "Charlie String", :cohort => :june},
 {:name => "Charlotte flat",:cohort => :june},
 {:name => "Thomas Bolt", :cohort => :june},
 {:name => "Zoe da Vinci", :cohort => :june},
 {:name => "Hannah Climb Every Mountain", :cohort => :june},
 {:name => "Joe Kerb Crawler", :cohort => :june},
 {:name => "Alex Dr. Beats", :cohort => :june},
 {:name => "Jeremy who?", :cohort => :june}
]
def print_header
	puts "The students of my cohort at Makers Academy"
	puts "------------------------"
end

def print(students)
	students.each do |student|
	puts "#{student[:name]} (#{student[:cohort]} cohort)"
	end
end

def print_footer(names)
	puts "Overall we have #{names.length} mighty students"
end
#nothing will happen until we do the last bit
print_header
print(students)
print_footer(students)

