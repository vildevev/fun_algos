# Time complexity = O(n)
# Space complexity = O(n)

# Edge cases accounted for:
# - Brackets not formatted correctly -> return function, ask user to format correctly
# - No multiplier in front of letters -> multiply it by 1

def decode_string(s)
  # Return the first string if the second is empty or not a string
  return puts "Please provide a valid input, ex. '4[ab]'" if !s.is_a? String or s == ''
  string = ''
  bracket_validator = []
  arr = []
  s.each_char do |el|
    if el != ']' and el != '['
      if /\A\d+\z/ === el
        if arr[-1].is_a? Numeric
          num = arr[-1].to_s.concat(el)
          arr[-1] = num.to_i
        else 
          arr.push(el.to_i)
        end
      elsif arr[-1].is_a? String
        arr[-1].concat(el)
      else
        arr.push(el)
      end
    else
      if el == '['
        bracket_validator.push(el)
      else 
        bracket_validator.pop
      end 
    end
  end
  # Return if the input is not formatted correctly
  return puts "Please format brackets correctly" if !bracket_validator.empty?
  i = arr.length - 1
  until i < 0 do
    if !string.empty?
      arr[i] = arr[i].concat(string)
    end
    # If the string doesn't contain a multiplier number
    multiplier = (arr[i-1].is_a? Numeric) ? arr[i-1] : 1
    string = arr[i] * multiplier
    i -= 2
  end
  p string
end

def run_file()
  decode_string(ARGV[0])
end 

run_file