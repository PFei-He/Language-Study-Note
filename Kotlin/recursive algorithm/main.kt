/**
 * Created by fay on 2017/7/24.
 */

fun main(args: Array<String>) {
    recursive(0)
}

fun recursive(i: Int) {
    var j = i
    if (j >= 10) {
        return
    } else {
        println(j)
        j++
        recursive(j)
    }
}
