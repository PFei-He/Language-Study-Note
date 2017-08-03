/**
 * Created by fay on 2017/7/20.
 */

fun main(args: Array<String>) {
    val array = arrayOf(2, 1, 3, 5, 4)
    println(bubbleSort(array).toList())
}

fun bubbleSort(array: Array<Int>): Array<Int> {
    var swapped : Boolean
    do {
        swapped = false
        for (i in 0..array.size - 2) {
            if (array[i] > array[i + 1]) {
                val temp = array[i]
                array[i] = array[i + 1]
                array[i + 1] = temp
                swapped = true
            }
        }
    } while (swapped)
    return array
}
