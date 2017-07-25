def main
  array = [2, 1, 3, 5, 4]
  puts quick_sort(array)
end

def quick_sort(array)
  return array if array.size < 2
  left, right = array[1..-1].partition { |y| y <= array.first }
  quick_sort(left) + [array.first] + quick_sort(right)
end

main
