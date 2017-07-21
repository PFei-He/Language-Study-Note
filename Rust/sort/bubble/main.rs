fn main() {
    let mut array = [2, 1, 3, 5, 4];
    println!("{:?}", bubble_sort(&mut array));
}

fn bubble_sort(array: &mut [i32]) -> &mut [i32] {
    let mut i = 0;
    let length = array.len();
    while i < length - 1 {
        let mut j = 0;
        while j < length - i - 1 {
            if array[j] > array[j+1] {
                let temp = array[j];
                array[j] = array[j+1];
                array[j+1] = temp;
            }
            j += 1;
        }
        i += 1;
    }
    return array;
}
