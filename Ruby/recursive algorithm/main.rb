def main
  recursive(0)
end

def recursive(i)
  if i >= 10
    0
  else
    puts i
    i = i + 1
    recursive(i)
  end
end

main
