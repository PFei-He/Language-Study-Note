def main():
    say(reply)

def end(content):
    print content

def reply(end):
    print "Hello Python!"
    end("^_^")

def say(reply):
    print "Hello World!"
    reply(end)

main()