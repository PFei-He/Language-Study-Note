/**
 * Created by fay on 2017/5/25.
 */

fun main(args: Array<String>) {
    say { string: String ->
        println(string)
        "Hello Kotlin!"
    }
}

fun say(lambda: (string: String) -> String) {
    println(lambda("Hello World!"))
}
