# Time complexity = O(m + n)
# Space complexity = O(n)

# Edge cases accounted for:
# - Strings are different lengths -> sorts the first string in order of the second, add additional characters to the end in alphabethical order
# - Second string is empty -> return the first string in original order
# - Second string is not a string -> return the first string in original order

def sort_by_string(s, t)
  # Return the first string if the second is empty or not a string
  return s if !t.is_a? String or t == ''
	s_chars = {}
  additional_chars = []
	new_str = ''
	s.each_char do |char|
		if s_chars[char]
			s_chars[char] += 1
		else 
			s_chars[char] = 1
		end 
	end
	t.each_char do |char|
		if s_chars[char]
			new_str.concat(char * s_chars[char])
      s_chars.delete(char)
		end 
	end
  if !s_chars.empty?
    # If the first string contains characters that are not present in the second string
    # add them in alphabetical order at the end
    s_chars.map { |k,v| new_str.concat(k * v) }
    additional_chars.sort! # Quicksort, O(n log n)
    additional_chars.each { |char| new_str.concat(char) }
  end
	p new_str
end

def run_file()
	sort_by_string(ARGV[0], ARGV[1])
end 

run_file