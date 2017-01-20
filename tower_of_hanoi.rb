#  There are 3 pegs. 
# Disks begin on 1 peg with the largest disk at the bottom and the smallest at the top. 

# Rules: 
# Only 1 disk can be moved at a time.
# Disks can only be moved if they are the top disc on their given stack 
# No disk may be placed on top of a smaller disk 


def setup_game
	# Instructions
	puts "Welcome to the Tower of Hanoi!"
	puts "There are 3 pegs and 3 disks. Currently all the disks are on peg number 1."
	puts "Goal: Get all the disks from peg number 1 onto either peg number 2 or 3."
	puts "Move a disk by specifying which peg number it is coming from and which peg number it is going to i.e. 1, 3"
	puts "Type 'quit' to exit the game."

	# Initial game structure 
	return [[3, 2, 1], [], []] 
end


def format_check(user_input, from_peg, to_peg)
	if (user_input.length == 2 && from_peg.between?(0,2) && to_peg.between?(0,2))
		return true
	else
		puts "Invalid input. Moves must be formatted as '1, 3'"
		return false
	end
end


def legal_move(peg_state, from_peg, to_peg)
	if peg_state[to_peg].empty?
		return true
	elsif peg_state[from_peg].empty?
		puts "There are no pegs on peg number #{from_peg+1}."
		return false
	elsif (peg_state[from_peg].last < peg_state[to_peg].last)
		return true
	else
		puts "Invalid move. Disks can only be moved to empty pegs or ontop of larger disks."
		return false
	end
end




def play 
	peg_state = setup_game   # [[3, 2, 1], [], []] 
	# print peg_state

	continue_game = true

	while continue_game
		print "Enter a move: "
		user_input = gets.chomp.strip.split(",")
		# puts user_input
		from_peg = user_input[0].to_i - 1
		# puts from_peg
		to_peg = user_input [1].to_i - 1
		# puts to_peg

		if user_input == ["quit"]
			exit
		elsif (format_check(user_input, from_peg, to_peg) == false) || (legal_move(peg_state, from_peg, to_peg) == false)
			redo
		end

		
		# validate_input(from_peg, to_peg)

		# puts from_peg, to_peg
		
	end

end



play