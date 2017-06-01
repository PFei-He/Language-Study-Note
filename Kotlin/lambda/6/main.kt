/**
 * Created by fay on 2017/5/29.
 */

fun main(args: Array<String>) {
    say {
        println(it)
        return@say "Hello Kotlin!"
    }
}

fun say(lambda: (String) -> String) {
    println(lambda("Hello World!"))
}
