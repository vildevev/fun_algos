# Time complexity = O(m + n)
# Space complexity = O(n)
def sort_by_string(s, t)
  # return the first string if the second is empty or not a string
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
    # If the first string contains characters that are not present in the second string, add them in alphabetical order at the end
    s_chars.map do |k,v| 
      additional_chars.push(k * v)
    end
    additional_chars.sort!
    additional_chars.each { |char| new_str.concat(char) }
  end  
	new_str
end

# Time complexity = O(n)
# Space complexity = O(n)
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

change_possibilities(4, [1,2,3])