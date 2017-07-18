def add(x)
  lambda { |y|
    return x+y
  }
end

puts add(8).(10)
