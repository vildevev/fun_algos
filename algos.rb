# Runtime = O(mn)
def sort_by_string(s, t)
	s_chars = {}
	new_str = ''
	s.split('').each do |char|
		if s_chars[char]
			s_chars[char] += 1
		else 
			s_chars[char] = 1
		end 
	end
	t.split('').each do |char|
		if s_chars[char]
			new_str.concat(char * s_chars[char])
		end 
	end 
	new_str
end