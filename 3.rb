# Time complexity = O(log n)
# Space complexity = O(n)

def change_possibilities(amount, array_length, target)
  # If the target is 0 there is only one solution
  return 1 if (target == 0)
 
  # If the target is less than 0 there are no solutions
  return 0 if (target < 0)
  
  # If there are no more integers i the array and
  # the target is greater than 0, then no
  # solution exist
  return 0 if (array_length <=0 and target >= 1)
  
  return change_possibilities(amount, array_length-1, target) + change_possibilities(amount, array_length, target-amount[array_length-1] )
end 

def run_file()
	# Turn the input string int array format
	arr = []
	ARGV[0].each_char {|char| /\A\d+\z/ === char && arr.push(char.to_i) }
	target = ARGV[1].to_i
	p change_possibilities(arr, arr.length, target)
end 

run_file