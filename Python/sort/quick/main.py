def main():
    array = [2, 1, 3, 5, 4]
    print quick_sort(array)

def quick_sort(array):
    if len(array) <= 1:
        return array
    left = [x for x in array[1:] if x <= array[0]]
    right = [x for x in array[1:] if x > array[0]]
    return quick_sort(left) + [array[0]] + quick_sort(right)

main()
