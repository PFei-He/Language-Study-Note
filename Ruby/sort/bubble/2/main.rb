def bubble_sort(array)
  0.upto(array.size-1) do |i|
    (i+1).upto(array.size-1) do |j|
      (array[j], array[j-1] = array[j-1], array[j]) if array[j] <= array[j-1]
    end
  end
  array
end

array = [2, 1, 3, 5, 4]
puts bubble_sort(array)
