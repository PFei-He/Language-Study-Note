def main()
  say(-> (content) {
    puts content
    return "Hello Ruby!"
  })
end

def say(reply)
  puts reply.call "Hello World!"
end

main
