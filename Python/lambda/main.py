def add(x):
    return lambda y : x + y

addx = add(8)

print addx(10)
