def main():
    recursive(0)

def recursive(i):
    if i >= 10:
        return
    else:
        print i
        i = i + 1
        recursive(i)

main()
