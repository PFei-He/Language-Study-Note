def main()
  say(lambda { |finish|
    puts "Hello Ruby!"
    finish.call "^_^"
  })
end

def say(reply)
  puts "Hello World!"
  reply.call lambda { |content|
    puts content
  }
end

main
