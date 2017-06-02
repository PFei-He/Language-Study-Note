def main():
    say(reply)

def reply(content):
    print content
    return "Hello Python!"

def say(reply):
    print reply("Hello World!")

main()
