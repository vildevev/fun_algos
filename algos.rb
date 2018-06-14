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

def decode_string(s)
  string = ''
  enumerator = 1
  add_to_string = ''
  s.each_char do |el|
    if el == ']'
      string.concat(add_to_string * enumerator)
      add_to_string = ''
    elsif /\A\d+\z/ === el
      enumerator = el.to_i
    elsif el != '['
      add_to_string.concat(el)
    end
  end
  string
end 