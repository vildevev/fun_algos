# Time complexity = O(n)
# Space complexity = O(n)
def decode_string(s)
  string = ''
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
    end
  end
  i = arr.length - 1
  until i < 0 do
    if !string.empty?
      arr[i] = arr[i].concat(string)
    end 
    if arr[i-1].is_a? Numeric 
      string = arr[i] * arr[i-1]
    end
    i -= 2
  end
  p string
end

def run_file()
  decode_string(ARGV[0])
end 

run_file