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
  p string
end

def run_file()
  decode_string(ARGV[0])
end 

run_file