def change_possibilities(target, nums)
	nums.each_with_index do |num, i|
		if num == target 
			possible += 1 
		elsif num + nums[i+1] == target 
			possible += 1 
		else
		end 
	end 
end 

def run_file()
	change_possibilities(ARGV[0], ARGV[1])
end 

run_file