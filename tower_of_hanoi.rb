# There are 3 pegs. 
# Disks begin on 1 peg with the largest disk at the bottom and the smallest at the top. 

# Rules: 
# Only 1 disk can be moved at a time.
# Disks can only be moved if they are the top disc on their given stack 
# No disk may be placed on top of a smaller disk 



# 
# 
# Kick off the game with the instructions and the starting disk placement
def setup_game
	puts "\nWelcome to the Tower of Hanoi!"
	puts "\tAll 3 of the disks will start on peg number 1."
	puts "\tGoal: Get all the disks from peg number 1 onto either peg number 2 or 3."
	puts "\tMove a disk by specifying which peg number it is coming from and which peg number it is going to i.e. 1, 3 \n \n"
	puts "Type 'summary' to see a visual of the current game state. \nType 'quit' to exit the game. \n \n"

	return [[3, 2, 1], [], []] 
end



# Check to make sure the user input is formatted correctly. 
# If not, the error message will be shown and they will be prompted
# to enter another input. 
def format_check(user_input, from_peg, to_peg)
	if (user_input.length == 2 && from_peg.between?(0,2) && to_peg.between?(0,2))
		return true
	else
		puts "Invalid input. Moves must be formatted as '1, 3'"
		return false
	end
end



# Verify the requested move is legal and possible.  
# If not, an error will be shown and the user will go again. 
def legal_move(peg_state, from_peg, to_peg)
	if peg_state[to_peg].length == 0 || peg_state[to_peg] == [nil]
		return true
	elsif peg_state[from_peg].length == 0
		puts "There are no pegs on peg number #{from_peg+1}."
		return false
	elsif (peg_state[from_peg].last < peg_state[to_peg].last)
		return true
	else
		puts "Invalid move. Disks can only be moved to empty pegs or ontop of larger disks."
		return false
	end
end




# Execute the moving of the disk from one peg to aother. 
def move_disk(peg_state, from_peg, to_peg)
 	peg_state[to_peg] << peg_state[from_peg].last
 	peg_state[from_peg].pop 
 return peg_state
end



# After the disk is moved, the program checks to see if the user has won. 
# If either peg 2 or 3 has all three disks on it
def check_if_won(peg_state)
	if peg_state[1].length == 3 || peg_state[2].length == 3
		return true
	else
		return false
	end
end

 

# Show a visual representation of where the disks are relative to their pegs 
def render (peg_state)
	line = 2
	while line >= 0
		puts ("o"*peg_state[0][line].to_i).ljust(10) + ("o"*peg_state[1][line].to_i).center(10) + ("o"*peg_state[2][line].to_i).rjust(10)
		line -= 1
	end

	puts "-" * 30 
	puts "Peg 1".ljust(10) + "Peg 2".center(10) + "Peg 3".rjust(10)
end




# Main script method. 
# Gets user input, checks for quit or summary keywords, and validates
# format and validity of user request before executing the move. 
def play 
	peg_state = setup_game  
	continue_game = true

	while continue_game
		print "Enter a move: "
		user_input = gets.chomp.strip.downcase.split(",")
		from_peg = user_input[0].to_i - 1
		to_peg = user_input [1].to_i - 1

		if user_input == ["quit"]
			exit
		elsif user_input == ["summary"]
			render(peg_state)
		elsif (format_check(user_input, from_peg, to_peg) == false) || (legal_move(peg_state, from_peg, to_peg) == false)
			redo
		else
			peg_state = move_disk(peg_state, from_peg, to_peg)
		end

		if check_if_won(peg_state)
			puts "Congratulations!! You figured out the Tower of Hanoi!"
			continue_game = false 
		end
	end
	exit
end


# Play the game! 
play




