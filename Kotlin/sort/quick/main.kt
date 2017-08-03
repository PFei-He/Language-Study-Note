/**
 * Created by fay on 2017/7/31.
 */

fun main(args: Array<String>) {
    val array = arrayListOf<Int>(2, 1, 3, 5, 4)
    println(quickSort(array))
}

fun quickSort(array: ArrayList<Int>) : ArrayList<Int> {
    if (array.size <= 1) {
        return array
    }

    val pivot = array[0]
    val left = ArrayList<Int>()
    val right = ArrayList<Int>()

    array.forEach {
        if (it < pivot) {
            left.add(it)
        } else if (it > pivot) {
            right.add(it)
        }
    }

    val result = ArrayList<Int>()

    for (i in 0..left.size - 1) {
        result.add(quickSort(left)[i])
    }

    result.add(pivot)

    for (i in 0..right.size - 1) {
        result.add(quickSort(right)[i])
    }

    return result
}
