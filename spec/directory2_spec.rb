

require 'directory2'

  context 'Program Core' do
  	describe 'Student Directory' do
    	it 'prints the header' do
    		expect(self).to receive(:show).with(header)
    	end
    end
  end

  describe 'Student Directory' do
  	it 'has a student' do
  		list = [{name: ‘Enrique’, cohort:June}]
  		expect(Students).to eq list
  	end

  	it 'can take user input' do
  		expect(self).to receive(:gets).and_return('')
  		take_user_input
  	end

  	it 'removes the new line when getting user input' do
  		input = "hello"
  		expect($stdin).to receive(:gets).and_return(input)
  		expect(take_user_input).to eq 'hello' #method follwed by a matcher
  	end

  	it 'prints a string to the terminal' do
  		expect(self).to receive(:puts).with('O HAI')
  		show('O HAI')
  	end

  	it 'prints the header' do
  		header = "Welcome to Student Directory!\nPlease input something"
  		expect(self).to receive(:show).with(header)
  		print_header
  	end
  end
