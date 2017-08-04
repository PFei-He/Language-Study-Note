/**
 * Created by fay on 2017/8/3.
 */

fun main(args: Array<String>) {
    print("A", "B", "C")
}

fun print(vararg values: String) {
    for (v in values) {
        println(v)
    }
}
