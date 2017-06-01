def add(x):
    return lambda y: x + y

print add(8)(10)
