class Array
  def bubble_sort
    for i in 0...(size - 1)
      for j in 0...(size - i - 1)
        self[j], self[j + 1] = self[j + 1], self[j] if self[j] > self[j + 1]
      end
    end
    self
  end
end

puts [2, 1, 3, 5, 4].bubble_sort
