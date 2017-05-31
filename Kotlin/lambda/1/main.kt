/**
 * Created by fay on 2017/5/25.
 */

fun main(args: Array<String>) {
    say { string: String ->
        println(string)
    }
}

fun say(lambda: (string: String) -> Unit) {
    lambda("Hello World!")
}
