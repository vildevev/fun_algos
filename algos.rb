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
  arr = []
  s.each_char do |el|
    if el != ']' || '['
      if /\A\d+\z/ === el
        arr.push(el.to_i)
      elsif arr[-1].is_a? String
        arr[-1].concat(el)
      else 
        arr.push(el)
      end 
    end
  end
  i = arr.length - 1
  until i < 0 do
    if string != ''
      arr[i].concat(string)
    end 
    string.prepend(arr[i] * arr[i-1])
    i -= 2
  end
  string
end 